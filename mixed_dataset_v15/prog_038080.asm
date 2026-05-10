; DESCRIPTION: Renders a magenta box of size 101x46 starting at (127, 25).
; PLAN: r0=127(x), r1=25(y), r2=101(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 25
LDI r2, 101
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
