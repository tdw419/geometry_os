; DESCRIPTION: Composite: Creates a purple rectangular region at (179, 163) spanning 107 by 24 pixels then Places a cyan line segment connecting (120, 183) to (111, 21) then Sets a single green pixel at (233, 24).
; PLAN: r0=179(x), r1=163(y), r2=107(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=183(y1), r7=111(x2), r8=21(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=24(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 163
LDI r2, 107
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 183
LDI r7, 111
LDI r8, 21
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 24
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
