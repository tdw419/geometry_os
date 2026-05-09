; DESCRIPTION: Renders a magenta box of size 51x120 starting at (142, 12).
; PLAN: r0=142(x), r1=12(y), r2=51(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 12
LDI r2, 51
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
