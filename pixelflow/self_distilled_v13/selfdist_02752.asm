; DESCRIPTION: Places a magenta 51x47 box at position (84, 175).
; PLAN: r0=84(x), r1=175(y), r2=51(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 175
LDI r2, 51
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
