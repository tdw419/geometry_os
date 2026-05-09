; DESCRIPTION: Renders a purple box of size 12x77 starting at (414, 178).
; PLAN: r0=414(x), r1=178(y), r2=12(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 178
LDI r2, 12
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
