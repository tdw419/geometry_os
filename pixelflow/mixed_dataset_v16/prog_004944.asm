; DESCRIPTION: Renders a white rectangular region spanning 44 by 38 at (311, 181).
; PLAN: r0=311(x), r1=181(y), r2=44(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 181
LDI r2, 44
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
