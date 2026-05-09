; DESCRIPTION: Renders a magenta box of size 109x81 starting at (26, 91).
; PLAN: r0=26(x), r1=91(y), r2=109(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 91
LDI r2, 109
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
