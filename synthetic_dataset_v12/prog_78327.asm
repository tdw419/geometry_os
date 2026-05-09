; DESCRIPTION: Renders a magenta box of size 98x25 starting at (40, 136).
; PLAN: r0=40(x), r1=136(y), r2=98(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 136
LDI r2, 98
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
