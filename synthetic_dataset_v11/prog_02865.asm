; DESCRIPTION: Creates a purple rectangular region at (82, 88) spanning 77 by 58 pixels.
; PLAN: r0=82(x), r1=88(y), r2=77(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 88
LDI r2, 77
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
