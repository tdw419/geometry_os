; DESCRIPTION: Places a orange 20x99 box at position (248, 176).
; PLAN: r0=248(x), r1=176(y), r2=20(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 176
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
