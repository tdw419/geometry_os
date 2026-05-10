; DESCRIPTION: Renders a magenta rectangular region spanning 120 by 52 at (363, 130).
; PLAN: r0=363(x), r1=130(y), r2=120(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 130
LDI r2, 120
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
