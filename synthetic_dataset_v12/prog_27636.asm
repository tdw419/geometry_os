; DESCRIPTION: Creates a purple rectangular region at (429, 222) spanning 34 by 34 pixels.
; PLAN: r0=429(x), r1=222(y), r2=34(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 222
LDI r2, 34
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
