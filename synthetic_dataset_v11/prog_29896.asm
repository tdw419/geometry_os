; DESCRIPTION: Renders a magenta box of size 47x114 starting at (16, 140).
; PLAN: r0=16(x), r1=140(y), r2=47(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 140
LDI r2, 47
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
