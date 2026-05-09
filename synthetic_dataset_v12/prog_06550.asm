; DESCRIPTION: Places a blue 118x98 rectangle at position (378, 26).
; PLAN: r0=378(x), r1=26(y), r2=118(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 26
LDI r2, 118
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
