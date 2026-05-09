; DESCRIPTION: Renders a magenta box of size 21x24 starting at (99, 45).
; PLAN: r0=99(x), r1=45(y), r2=21(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 45
LDI r2, 21
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
