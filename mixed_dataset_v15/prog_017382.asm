; DESCRIPTION: Renders a magenta box of size 25x33 starting at (166, 222).
; PLAN: r0=166(x), r1=222(y), r2=25(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 222
LDI r2, 25
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
