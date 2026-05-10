; DESCRIPTION: Renders a magenta box of size 64x68 starting at (61, 123).
; PLAN: r0=61(x), r1=123(y), r2=64(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 123
LDI r2, 64
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
