; DESCRIPTION: Renders a magenta box of size 51x87 starting at (407, 34).
; PLAN: r0=407(x), r1=34(y), r2=51(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 34
LDI r2, 51
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
