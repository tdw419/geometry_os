; DESCRIPTION: Creates a blue rectangular region at (257, 28) spanning 51 by 114 pixels.
; PLAN: r0=257(x), r1=28(y), r2=51(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 28
LDI r2, 51
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
