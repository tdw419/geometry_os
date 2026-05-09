; DESCRIPTION: Places a blue 44x94 rectangle at position (179, 4).
; PLAN: r0=179(x), r1=4(y), r2=44(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 4
LDI r2, 44
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
