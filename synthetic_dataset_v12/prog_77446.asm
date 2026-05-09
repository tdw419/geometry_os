; DESCRIPTION: Creates a blue rectangular region at (257, 109) spanning 21 by 87 pixels.
; PLAN: r0=257(x), r1=109(y), r2=21(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 109
LDI r2, 21
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
