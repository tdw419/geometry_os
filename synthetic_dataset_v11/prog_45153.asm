; DESCRIPTION: Creates a purple rectangular region at (68, 119) spanning 18 by 21 pixels.
; PLAN: r0=68(x), r1=119(y), r2=18(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 119
LDI r2, 18
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
