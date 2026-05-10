; DESCRIPTION: Creates a purple rectangular region at (266, 131) spanning 43 by 87 pixels.
; PLAN: r0=266(x), r1=131(y), r2=43(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 131
LDI r2, 43
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
