; DESCRIPTION: Creates a purple rectangular region at (229, 36) spanning 92 by 119 pixels.
; PLAN: r0=229(x), r1=36(y), r2=92(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 36
LDI r2, 92
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
