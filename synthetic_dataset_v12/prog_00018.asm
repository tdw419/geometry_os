; DESCRIPTION: Renders a magenta box of size 33x62 starting at (100, 160).
; PLAN: r0=100(x), r1=160(y), r2=33(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 160
LDI r2, 33
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
