; DESCRIPTION: Places a blue 51x15 box at position (19, 120).
; PLAN: r0=19(x), r1=120(y), r2=51(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 51
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
