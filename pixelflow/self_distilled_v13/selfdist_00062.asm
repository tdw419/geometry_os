; DESCRIPTION: Places a blue 51x60 box at position (221, 184).
; PLAN: r0=221(x), r1=184(y), r2=51(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 184
LDI r2, 51
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
