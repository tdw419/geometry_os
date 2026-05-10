; DESCRIPTION: Renders a orange rectangular region spanning 69 by 119 at (298, 3).
; PLAN: r0=298(x), r1=3(y), r2=69(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 3
LDI r2, 69
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
