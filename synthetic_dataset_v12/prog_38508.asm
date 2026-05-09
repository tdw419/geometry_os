; DESCRIPTION: Composite: Renders a yellow disk with center (290, 84) and radius 42 then Sets a single white pixel at (423, 67) then Renders a white box of size 108x75 starting at (149, 88).
; PLAN: r0=290(x), r1=84(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x), r6=67(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=149(x), r11=88(y), r12=108(width), r13=75(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 84
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 67
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 149
LDI r11, 88
LDI r12, 108
LDI r13, 75
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
