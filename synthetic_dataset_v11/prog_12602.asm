; DESCRIPTION: Renders a magenta box of size 35x80 starting at (200, 142).
; PLAN: r0=200(x), r1=142(y), r2=35(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 35
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
