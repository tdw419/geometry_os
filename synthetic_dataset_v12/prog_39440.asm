; DESCRIPTION: Renders a magenta box of size 108x26 starting at (279, 54).
; PLAN: r0=279(x), r1=54(y), r2=108(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 54
LDI r2, 108
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
