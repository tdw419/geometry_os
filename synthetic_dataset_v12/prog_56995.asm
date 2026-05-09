; DESCRIPTION: Renders a magenta box of size 113x24 starting at (137, 200).
; PLAN: r0=137(x), r1=200(y), r2=113(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 200
LDI r2, 113
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
