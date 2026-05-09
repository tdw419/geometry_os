; DESCRIPTION: Creates a purple rectangular region at (126, 155) spanning 45 by 15 pixels.
; PLAN: r0=126(x), r1=155(y), r2=45(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 155
LDI r2, 45
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
