; DESCRIPTION: Places a blue 24x97 rectangle at position (324, 45).
; PLAN: r0=324(x), r1=45(y), r2=24(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 45
LDI r2, 24
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
