; DESCRIPTION: Creates a yellow rectangular region at (186, 134) spanning 110 by 92 pixels.
; PLAN: r0=186(x), r1=134(y), r2=110(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 134
LDI r2, 110
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
