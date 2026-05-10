; DESCRIPTION: Creates a purple rectangular region at (358, 193) spanning 89 by 28 pixels.
; PLAN: r0=358(x), r1=193(y), r2=89(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 193
LDI r2, 89
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
