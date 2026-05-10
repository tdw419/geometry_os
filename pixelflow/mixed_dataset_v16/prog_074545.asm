; DESCRIPTION: Places a blue 15x51 rectangle at position (112, 83).
; PLAN: r0=112(x), r1=83(y), r2=15(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 83
LDI r2, 15
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
