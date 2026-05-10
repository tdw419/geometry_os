; DESCRIPTION: Renders a magenta box of size 40x54 starting at (7, 84).
; PLAN: r0=7(x), r1=84(y), r2=40(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 84
LDI r2, 40
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
