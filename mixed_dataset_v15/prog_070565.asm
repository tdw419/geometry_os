; DESCRIPTION: Renders a orange rectangular region spanning 20 by 100 at (307, 124).
; PLAN: r0=307(x), r1=124(y), r2=20(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 124
LDI r2, 20
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
