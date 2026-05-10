; DESCRIPTION: Creates a purple rectangular region at (16, 6) spanning 105 by 95 pixels.
; PLAN: r0=16(x), r1=6(y), r2=105(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 6
LDI r2, 105
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
