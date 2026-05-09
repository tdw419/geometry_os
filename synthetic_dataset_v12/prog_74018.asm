; DESCRIPTION: Renders a magenta box of size 28x29 starting at (80, 71).
; PLAN: r0=80(x), r1=71(y), r2=28(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 71
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
