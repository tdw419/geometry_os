; DESCRIPTION: Creates a blue rectangular region at (449, 81) spanning 63 by 116 pixels.
; PLAN: r0=449(x), r1=81(y), r2=63(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 81
LDI r2, 63
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
