; DESCRIPTION: Renders a orange rectangular region spanning 110 by 92 at (145, 33).
; PLAN: r0=145(x), r1=33(y), r2=110(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 33
LDI r2, 110
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
