; DESCRIPTION: Renders a magenta box of size 109x100 starting at (164, 87).
; PLAN: r0=164(x), r1=87(y), r2=109(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 87
LDI r2, 109
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
