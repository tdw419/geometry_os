; DESCRIPTION: Renders a magenta box of size 66x38 starting at (4, 51).
; PLAN: r0=4(x), r1=51(y), r2=66(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 51
LDI r2, 66
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
