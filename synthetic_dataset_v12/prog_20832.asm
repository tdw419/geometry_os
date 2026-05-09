; DESCRIPTION: Renders a magenta box of size 40x25 starting at (4, 158).
; PLAN: r0=4(x), r1=158(y), r2=40(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 158
LDI r2, 40
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
