; DESCRIPTION: Renders a magenta box of size 51x29 starting at (252, 120).
; PLAN: r0=252(x), r1=120(y), r2=51(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 120
LDI r2, 51
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
