; DESCRIPTION: Places a orange 90x78 rectangle at position (201, 132).
; PLAN: r0=201(x), r1=132(y), r2=90(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 132
LDI r2, 90
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
