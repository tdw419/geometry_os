; DESCRIPTION: Creates a purple rectangular region at (257, 194) spanning 93 by 20 pixels.
; PLAN: r0=257(x), r1=194(y), r2=93(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 194
LDI r2, 93
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
