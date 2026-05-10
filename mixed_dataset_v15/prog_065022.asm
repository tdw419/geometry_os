; DESCRIPTION: Renders a magenta box of size 114x14 starting at (395, 54).
; PLAN: r0=395(x), r1=54(y), r2=114(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 54
LDI r2, 114
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
