; DESCRIPTION: Renders a magenta box of size 111x40 starting at (73, 123).
; PLAN: r0=73(x), r1=123(y), r2=111(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 123
LDI r2, 111
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
