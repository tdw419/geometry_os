; DESCRIPTION: Creates a purple rectangular region at (377, 116) spanning 91 by 14 pixels.
; PLAN: r0=377(x), r1=116(y), r2=91(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 116
LDI r2, 91
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
