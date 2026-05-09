; DESCRIPTION: Places a magenta 97x31 rectangle at position (44, 207).
; PLAN: r0=44(x), r1=207(y), r2=97(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 207
LDI r2, 97
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
