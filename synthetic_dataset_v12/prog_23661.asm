; DESCRIPTION: Renders a magenta box of size 100x46 starting at (412, 9).
; PLAN: r0=412(x), r1=9(y), r2=100(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 9
LDI r2, 100
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
