; DESCRIPTION: Renders a magenta box of size 51x58 starting at (429, 116).
; PLAN: r0=429(x), r1=116(y), r2=51(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 116
LDI r2, 51
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
