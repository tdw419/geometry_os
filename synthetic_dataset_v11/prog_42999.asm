; DESCRIPTION: Renders a magenta box of size 15x14 starting at (10, 9).
; PLAN: r0=10(x), r1=9(y), r2=15(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 9
LDI r2, 15
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
