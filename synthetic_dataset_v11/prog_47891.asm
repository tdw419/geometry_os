; DESCRIPTION: Places a blue 107x97 rectangle at position (4, 68).
; PLAN: r0=4(x), r1=68(y), r2=107(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 68
LDI r2, 107
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
