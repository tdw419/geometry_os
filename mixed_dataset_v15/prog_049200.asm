; DESCRIPTION: Renders a orange rectangular region spanning 35 by 61 at (96, 77).
; PLAN: r0=96(x), r1=77(y), r2=35(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 77
LDI r2, 35
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
