; DESCRIPTION: Places a cyan 97x97 rectangle at position (159, 78).
; PLAN: r0=159(x), r1=78(y), r2=97(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 78
LDI r2, 97
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
