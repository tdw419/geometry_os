; DESCRIPTION: Creates a yellow rectangular region at (204, 51) spanning 17 by 20 pixels.
; PLAN: r0=204(x), r1=51(y), r2=17(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 51
LDI r2, 17
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
