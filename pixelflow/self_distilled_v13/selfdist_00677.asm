; DESCRIPTION: Places a orange 102x80 box at position (334, 15).
; PLAN: r0=334(x), r1=15(y), r2=102(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 15
LDI r2, 102
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
