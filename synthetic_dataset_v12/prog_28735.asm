; DESCRIPTION: Renders a magenta box of size 65x106 starting at (57, 28).
; PLAN: r0=57(x), r1=28(y), r2=65(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 28
LDI r2, 65
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
