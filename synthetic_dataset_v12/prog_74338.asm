; DESCRIPTION: Renders a magenta box of size 58x68 starting at (124, 144).
; PLAN: r0=124(x), r1=144(y), r2=58(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 144
LDI r2, 58
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
