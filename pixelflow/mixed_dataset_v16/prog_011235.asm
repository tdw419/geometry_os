; DESCRIPTION: Renders a magenta box of size 19x95 starting at (468, 23).
; PLAN: r0=468(x), r1=23(y), r2=19(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 23
LDI r2, 19
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
