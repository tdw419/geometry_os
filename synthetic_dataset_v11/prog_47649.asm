; DESCRIPTION: Creates a yellow rectangular region at (131, 51) spanning 74 by 85 pixels.
; PLAN: r0=131(x), r1=51(y), r2=74(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 51
LDI r2, 74
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
