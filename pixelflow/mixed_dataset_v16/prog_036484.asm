; DESCRIPTION: Places a red 97x87 box at position (50, 9).
; PLAN: r0=50(x), r1=9(y), r2=97(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 9
LDI r2, 97
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
