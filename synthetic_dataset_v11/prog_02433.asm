; DESCRIPTION: Places a black 106x97 rectangle at position (16, 44).
; PLAN: r0=16(x), r1=44(y), r2=106(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 44
LDI r2, 106
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
