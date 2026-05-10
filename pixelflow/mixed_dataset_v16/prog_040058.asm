; DESCRIPTION: Creates a blue filled rectangle of size 25x105 starting at (209, 66).
; PLAN: r0=209(x), r1=66(y), r2=25(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 66
LDI r2, 25
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
