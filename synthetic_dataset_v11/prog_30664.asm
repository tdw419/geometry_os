; DESCRIPTION: Creates a blue rectangular region at (10, 94) spanning 116 by 45 pixels.
; PLAN: r0=10(x), r1=94(y), r2=116(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 94
LDI r2, 116
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
