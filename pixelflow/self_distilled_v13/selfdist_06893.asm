; DESCRIPTION: Renders a blue rectangular region spanning 50 by 105 at (81, 90).
; PLAN: r0=81(x), r1=90(y), r2=50(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 90
LDI r2, 50
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
