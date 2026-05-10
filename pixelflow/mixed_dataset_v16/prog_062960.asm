; DESCRIPTION: Renders a orange rectangular region spanning 118 by 53 at (235, 39).
; PLAN: r0=235(x), r1=39(y), r2=118(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 39
LDI r2, 118
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
