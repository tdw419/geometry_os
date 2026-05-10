; DESCRIPTION: Composite: Renders a green line between points (338, 105) and (107, 95) then Places a orange 110x117 rectangle at position (64, 50).
; PLAN: r0=338(x1), r1=105(y1), r2=107(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=50(y), r7=110(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 105
LDI r2, 107
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 50
LDI r7, 110
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
