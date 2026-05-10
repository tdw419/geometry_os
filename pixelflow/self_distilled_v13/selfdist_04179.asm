; DESCRIPTION: Renders a orange rectangular region spanning 36 by 105 at (20, 51).
; PLAN: r0=20(x), r1=51(y), r2=36(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 51
LDI r2, 36
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
