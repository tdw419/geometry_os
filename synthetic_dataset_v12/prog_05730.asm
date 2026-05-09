; DESCRIPTION: Creates a green rectangular region at (43, 41) spanning 51 by 20 pixels.
; PLAN: r0=43(x), r1=41(y), r2=51(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 41
LDI r2, 51
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
