; DESCRIPTION: Renders a magenta box of size 55x52 starting at (110, 102).
; PLAN: r0=110(x), r1=102(y), r2=55(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 102
LDI r2, 55
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
