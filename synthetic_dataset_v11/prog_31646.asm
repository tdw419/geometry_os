; DESCRIPTION: Creates a purple rectangular region at (135, 167) spanning 15 by 48 pixels.
; PLAN: r0=135(x), r1=167(y), r2=15(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 167
LDI r2, 15
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
