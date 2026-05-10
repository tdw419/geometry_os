; DESCRIPTION: Places a orange 80x106 box at position (323, 180).
; PLAN: r0=323(x), r1=180(y), r2=80(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 180
LDI r2, 80
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
