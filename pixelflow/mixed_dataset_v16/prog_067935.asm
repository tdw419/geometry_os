; DESCRIPTION: Renders a magenta box of size 75x68 starting at (188, 99).
; PLAN: r0=188(x), r1=99(y), r2=75(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 99
LDI r2, 75
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
