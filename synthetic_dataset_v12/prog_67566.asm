; DESCRIPTION: Creates a blue rectangular region at (257, 202) spanning 114 by 34 pixels.
; PLAN: r0=257(x), r1=202(y), r2=114(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 202
LDI r2, 114
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
