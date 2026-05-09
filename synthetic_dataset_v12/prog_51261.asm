; DESCRIPTION: Places a orange 114x99 rectangle at position (106, 105).
; PLAN: r0=106(x), r1=105(y), r2=114(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 105
LDI r2, 114
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
