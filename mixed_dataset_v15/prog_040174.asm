; DESCRIPTION: Creates a purple rectangular region at (377, 205) spanning 116 by 12 pixels.
; PLAN: r0=377(x), r1=205(y), r2=116(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 205
LDI r2, 116
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
