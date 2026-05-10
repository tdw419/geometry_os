; DESCRIPTION: Places a blue 51x28 rectangle at position (77, 3).
; PLAN: r0=77(x), r1=3(y), r2=51(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 3
LDI r2, 51
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
