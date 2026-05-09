; DESCRIPTION: Renders a purple box of size 100x77 starting at (273, 91).
; PLAN: r0=273(x), r1=91(y), r2=100(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 91
LDI r2, 100
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
