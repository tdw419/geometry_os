; DESCRIPTION: Composite: Creates a black rectangular region at (64, 49) spanning 25 by 95 pixels then Draws a cyan line from (87, 45) to (399, 225).
; PLAN: r0=64(x), r1=49(y), r2=25(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=45(y1), r7=399(x2), r8=225(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 49
LDI r2, 25
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 45
LDI r7, 399
LDI r8, 225
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
