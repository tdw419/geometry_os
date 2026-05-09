; DESCRIPTION: Renders a magenta box of size 16x51 starting at (461, 176).
; PLAN: r0=461(x), r1=176(y), r2=16(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 176
LDI r2, 16
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
