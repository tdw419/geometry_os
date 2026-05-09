; DESCRIPTION: Renders a magenta box of size 89x29 starting at (19, 154).
; PLAN: r0=19(x), r1=154(y), r2=89(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 154
LDI r2, 89
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
