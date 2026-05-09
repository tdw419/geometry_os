; DESCRIPTION: Creates a purple rectangular region at (257, 235) spanning 96 by 13 pixels.
; PLAN: r0=257(x), r1=235(y), r2=96(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 235
LDI r2, 96
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
