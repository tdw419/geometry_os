; DESCRIPTION: Renders a magenta box of size 54x108 starting at (44, 52).
; PLAN: r0=44(x), r1=52(y), r2=54(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 52
LDI r2, 54
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
