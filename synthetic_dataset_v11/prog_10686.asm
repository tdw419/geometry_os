; DESCRIPTION: Renders a magenta box of size 49x61 starting at (132, 40).
; PLAN: r0=132(x), r1=40(y), r2=49(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 40
LDI r2, 49
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
