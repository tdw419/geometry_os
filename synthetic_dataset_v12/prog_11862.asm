; DESCRIPTION: Renders a magenta box of size 96x33 starting at (366, 72).
; PLAN: r0=366(x), r1=72(y), r2=96(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 72
LDI r2, 96
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
