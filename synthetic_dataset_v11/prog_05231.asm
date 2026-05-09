; DESCRIPTION: Creates a purple rectangular region at (85, 65) spanning 61 by 94 pixels.
; PLAN: r0=85(x), r1=65(y), r2=61(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 65
LDI r2, 61
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
