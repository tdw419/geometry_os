; DESCRIPTION: Renders a magenta box of size 39x69 starting at (451, 160).
; PLAN: r0=451(x), r1=160(y), r2=39(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 160
LDI r2, 39
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
