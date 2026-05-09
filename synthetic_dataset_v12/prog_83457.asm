; DESCRIPTION: Renders a magenta box of size 106x52 starting at (266, 4).
; PLAN: r0=266(x), r1=4(y), r2=106(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 4
LDI r2, 106
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
