; DESCRIPTION: Renders a magenta box of size 87x92 starting at (96, 84).
; PLAN: r0=96(x), r1=84(y), r2=87(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 84
LDI r2, 87
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
