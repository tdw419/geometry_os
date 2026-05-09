; DESCRIPTION: Creates a purple rectangular region at (36, 116) spanning 94 by 45 pixels.
; PLAN: r0=36(x), r1=116(y), r2=94(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 116
LDI r2, 94
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
