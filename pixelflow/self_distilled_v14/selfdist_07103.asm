; DESCRIPTION: Renders a orange rectangular region spanning 74 by 87 at (80, 137).
; PLAN: r0=80(x), r1=137(y), r2=74(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 137
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
