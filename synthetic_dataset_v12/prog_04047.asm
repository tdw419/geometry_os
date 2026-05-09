; DESCRIPTION: Places a orange 97x51 rectangle at position (259, 86).
; PLAN: r0=259(x), r1=86(y), r2=97(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 86
LDI r2, 97
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
