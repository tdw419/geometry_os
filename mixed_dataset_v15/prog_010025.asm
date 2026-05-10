; DESCRIPTION: Composite: Places a red line segment connecting (456, 236) to (96, 120) then Creates a black rectangular region at (332, 159) spanning 94 by 27 pixels.
; PLAN: r0=456(x1), r1=236(y1), r2=96(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=159(y), r7=94(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 236
LDI r2, 96
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 159
LDI r7, 94
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
