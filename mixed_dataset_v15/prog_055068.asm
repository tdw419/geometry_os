; DESCRIPTION: Composite: Draws a white circle centered at (205, 108) with radius 68 then Renders a white box of size 59x84 starting at (5, 65) then Sets a single red pixel at (237, 48).
; PLAN: r0=205(x), r1=108(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=65(y), r7=59(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=237(x), r11=48(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 108
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 65
LDI r7, 59
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 48
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
