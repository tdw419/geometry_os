; DESCRIPTION: Renders a orange rectangular region spanning 34 by 74 at (251, 94).
; PLAN: r0=251(x), r1=94(y), r2=34(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 94
LDI r2, 34
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
