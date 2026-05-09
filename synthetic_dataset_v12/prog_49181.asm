; DESCRIPTION: Creates a purple rectangular region at (395, 212) spanning 14 by 36 pixels.
; PLAN: r0=395(x), r1=212(y), r2=14(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 212
LDI r2, 14
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
