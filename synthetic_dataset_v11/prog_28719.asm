; DESCRIPTION: Creates a purple rectangular region at (199, 193) spanning 56 by 24 pixels.
; PLAN: r0=199(x), r1=193(y), r2=56(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 193
LDI r2, 56
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
