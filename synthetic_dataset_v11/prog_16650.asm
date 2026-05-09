; DESCRIPTION: Places a blue 108x51 rectangle at position (30, 112).
; PLAN: r0=30(x), r1=112(y), r2=108(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 112
LDI r2, 108
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
