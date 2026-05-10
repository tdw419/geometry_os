; DESCRIPTION: Renders a blue rectangular region spanning 20 by 18 at (275, 181).
; PLAN: r0=275(x), r1=181(y), r2=20(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 181
LDI r2, 20
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
