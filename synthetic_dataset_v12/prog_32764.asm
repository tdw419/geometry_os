; DESCRIPTION: Places a blue 71x51 rectangle at position (310, 77).
; PLAN: r0=310(x), r1=77(y), r2=71(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 77
LDI r2, 71
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
