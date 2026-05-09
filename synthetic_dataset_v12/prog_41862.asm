; DESCRIPTION: Composite: Renders a cyan line between points (24, 3) and (159, 78) then Creates a orange rectangular region at (435, 202) spanning 71 by 35 pixels then Sets a single green pixel at (118, 187).
; PLAN: r0=24(x1), r1=3(y1), r2=159(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=202(y), r7=71(width), r8=35(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=118(x), r11=187(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 3
LDI r2, 159
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 202
LDI r7, 71
LDI r8, 35
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 118
LDI r11, 187
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
