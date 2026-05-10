; DESCRIPTION: Composite: Draws a white circle centered at (190, 139) with radius 39 then Renders a green box of size 93x34 starting at (265, 98) then Places a green line segment connecting (224, 161) to (4, 161).
; PLAN: r0=190(x), r1=139(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=98(y), r7=93(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x1), r11=161(y1), r12=4(x2), r13=161(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 139
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 98
LDI r7, 93
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 161
LDI r12, 4
LDI r13, 161
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
