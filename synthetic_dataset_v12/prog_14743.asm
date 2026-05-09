; DESCRIPTION: Renders a magenta box of size 108x109 starting at (345, 144).
; PLAN: r0=345(x), r1=144(y), r2=108(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 144
LDI r2, 108
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
