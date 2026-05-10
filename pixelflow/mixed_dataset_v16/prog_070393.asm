; DESCRIPTION: Renders a magenta box of size 98x34 starting at (313, 1).
; PLAN: r0=313(x), r1=1(y), r2=98(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 1
LDI r2, 98
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
