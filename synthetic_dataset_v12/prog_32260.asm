; DESCRIPTION: Creates a blue rectangular region at (94, 1) spanning 15 by 82 pixels.
; PLAN: r0=94(x), r1=1(y), r2=15(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 1
LDI r2, 15
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
