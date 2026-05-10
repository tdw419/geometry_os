; DESCRIPTION: Renders a magenta box of size 10x96 starting at (55, 83).
; PLAN: r0=55(x), r1=83(y), r2=10(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 83
LDI r2, 10
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
