; DESCRIPTION: Renders a magenta box of size 114x81 starting at (388, 86).
; PLAN: r0=388(x), r1=86(y), r2=114(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 86
LDI r2, 114
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
