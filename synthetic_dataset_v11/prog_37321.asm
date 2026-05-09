; DESCRIPTION: Creates a yellow rectangular region at (121, 50) spanning 43 by 110 pixels.
; PLAN: r0=121(x), r1=50(y), r2=43(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 50
LDI r2, 43
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
