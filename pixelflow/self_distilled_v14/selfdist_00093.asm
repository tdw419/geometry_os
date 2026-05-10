; DESCRIPTION: Places a orange 73x101 box at position (185, 27).
; PLAN: r0=185(x), r1=27(y), r2=73(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 27
LDI r2, 73
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
