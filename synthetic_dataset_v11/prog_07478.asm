; DESCRIPTION: Creates a purple rectangular region at (92, 9) spanning 115 by 24 pixels.
; PLAN: r0=92(x), r1=9(y), r2=115(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 9
LDI r2, 115
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
