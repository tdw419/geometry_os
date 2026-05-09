; DESCRIPTION: Creates a yellow rectangular region at (51, 50) spanning 20 by 61 pixels.
; PLAN: r0=51(x), r1=50(y), r2=20(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 50
LDI r2, 20
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
