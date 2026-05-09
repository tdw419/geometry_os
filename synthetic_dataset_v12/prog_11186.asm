; DESCRIPTION: Renders a magenta box of size 18x99 starting at (375, 2).
; PLAN: r0=375(x), r1=2(y), r2=18(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 2
LDI r2, 18
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
