; DESCRIPTION: Renders a magenta box of size 46x35 starting at (58, 136).
; PLAN: r0=58(x), r1=136(y), r2=46(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 136
LDI r2, 46
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
