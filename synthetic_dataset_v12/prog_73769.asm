; DESCRIPTION: Places a green 97x44 rectangle at position (195, 141).
; PLAN: r0=195(x), r1=141(y), r2=97(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 141
LDI r2, 97
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
