; DESCRIPTION: Renders a magenta box of size 44x29 starting at (24, 140).
; PLAN: r0=24(x), r1=140(y), r2=44(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 140
LDI r2, 44
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
