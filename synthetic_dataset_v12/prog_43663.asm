; DESCRIPTION: Creates a purple rectangular region at (15, 68) spanning 43 by 120 pixels.
; PLAN: r0=15(x), r1=68(y), r2=43(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 68
LDI r2, 43
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
