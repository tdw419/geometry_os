; DESCRIPTION: Renders a purple rectangular region spanning 63 by 81 at (259, 87).
; PLAN: r0=259(x), r1=87(y), r2=63(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 87
LDI r2, 63
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
