; DESCRIPTION: Renders a magenta box of size 66x45 starting at (129, 136).
; PLAN: r0=129(x), r1=136(y), r2=66(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 136
LDI r2, 66
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
