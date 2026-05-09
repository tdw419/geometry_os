; DESCRIPTION: Creates a white rectangular region at (110, 40) spanning 58 by 92 pixels.
; PLAN: r0=110(x), r1=40(y), r2=58(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 40
LDI r2, 58
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
