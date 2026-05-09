; DESCRIPTION: Renders a magenta box of size 32x22 starting at (25, 35).
; PLAN: r0=25(x), r1=35(y), r2=32(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 35
LDI r2, 32
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
