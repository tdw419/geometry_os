; DESCRIPTION: Creates a yellow rectangular region at (110, 171) spanning 92 by 79 pixels.
; PLAN: r0=110(x), r1=171(y), r2=92(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 171
LDI r2, 92
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
