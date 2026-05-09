; DESCRIPTION: Composite: Draws a red circle centered at (169, 123) with radius 57 then Renders a white box of size 112x20 starting at (71, 27) then Sets a single green pixel at (231, 74).
; PLAN: r0=169(x), r1=123(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=27(y), r7=112(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=231(x), r11=74(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 123
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 27
LDI r7, 112
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 231
LDI r11, 74
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
