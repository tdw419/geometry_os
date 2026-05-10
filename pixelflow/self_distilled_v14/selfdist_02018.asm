; DESCRIPTION: Places a orange 119x35 box at position (189, 1).
; PLAN: r0=189(x), r1=1(y), r2=119(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 1
LDI r2, 119
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
