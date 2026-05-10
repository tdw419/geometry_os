; DESCRIPTION: Places a orange 68x17 box at position (366, 17).
; PLAN: r0=366(x), r1=17(y), r2=68(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 17
LDI r2, 68
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
