; DESCRIPTION: Composite: Creates a green rectangular region at (285, 195) spanning 17 by 32 pixels then Renders a orange line between points (185, 80) and (204, 78) then Sets a single orange pixel at (243, 70).
; PLAN: r0=285(x), r1=195(y), r2=17(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=80(y1), r7=204(x2), r8=78(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=70(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 195
LDI r2, 17
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 80
LDI r7, 204
LDI r8, 78
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 70
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
