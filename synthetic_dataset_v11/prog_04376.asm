; DESCRIPTION: Renders a magenta box of size 47x96 starting at (145, 24).
; PLAN: r0=145(x), r1=24(y), r2=47(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 24
LDI r2, 47
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
