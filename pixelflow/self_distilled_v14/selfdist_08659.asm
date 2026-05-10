; DESCRIPTION: Places a blue 22x100 box at position (113, 175).
; PLAN: r0=113(x), r1=175(y), r2=22(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 175
LDI r2, 22
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
