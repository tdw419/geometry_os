; DESCRIPTION: Creates a yellow rectangular region at (153, 136) spanning 50 by 85 pixels.
; PLAN: r0=153(x), r1=136(y), r2=50(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 136
LDI r2, 50
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
