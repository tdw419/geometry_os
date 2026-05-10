; DESCRIPTION: Creates a purple rectangular region at (395, 145) spanning 86 by 45 pixels.
; PLAN: r0=395(x), r1=145(y), r2=86(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 145
LDI r2, 86
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
