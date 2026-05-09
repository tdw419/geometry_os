; DESCRIPTION: Renders a magenta box of size 10x51 starting at (187, 131).
; PLAN: r0=187(x), r1=131(y), r2=10(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 131
LDI r2, 10
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
