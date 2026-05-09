; DESCRIPTION: Renders a magenta box of size 52x110 starting at (411, 18).
; PLAN: r0=411(x), r1=18(y), r2=52(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 18
LDI r2, 52
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
