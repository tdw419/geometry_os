; DESCRIPTION: Renders a magenta box of size 81x24 starting at (365, 72).
; PLAN: r0=365(x), r1=72(y), r2=81(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 72
LDI r2, 81
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
