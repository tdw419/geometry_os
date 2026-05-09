; DESCRIPTION: Renders a magenta box of size 33x60 starting at (120, 136).
; PLAN: r0=120(x), r1=136(y), r2=33(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 136
LDI r2, 33
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
