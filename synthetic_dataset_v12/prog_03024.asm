; DESCRIPTION: Places a blue 25x23 rectangle at position (106, 183).
; PLAN: r0=106(x), r1=183(y), r2=25(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 183
LDI r2, 25
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
