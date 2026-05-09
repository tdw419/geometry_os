; DESCRIPTION: Renders a magenta box of size 101x70 starting at (313, 40).
; PLAN: r0=313(x), r1=40(y), r2=101(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 40
LDI r2, 101
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
