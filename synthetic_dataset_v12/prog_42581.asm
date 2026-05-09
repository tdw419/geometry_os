; DESCRIPTION: Renders a magenta box of size 80x74 starting at (319, 26).
; PLAN: r0=319(x), r1=26(y), r2=80(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 26
LDI r2, 80
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
