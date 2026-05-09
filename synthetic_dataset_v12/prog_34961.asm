; DESCRIPTION: Renders a magenta box of size 108x91 starting at (265, 136).
; PLAN: r0=265(x), r1=136(y), r2=108(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 136
LDI r2, 108
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
