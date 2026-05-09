; DESCRIPTION: Composite: Renders a orange box of size 81x85 starting at (141, 31) then Renders a cyan line between points (131, 166) and (179, 160).
; PLAN: r0=141(x), r1=31(y), r2=81(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=166(y1), r7=179(x2), r8=160(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 31
LDI r2, 81
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 166
LDI r7, 179
LDI r8, 160
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
