; DESCRIPTION: Renders a magenta box of size 109x103 starting at (119, 8).
; PLAN: r0=119(x), r1=8(y), r2=109(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 8
LDI r2, 109
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
