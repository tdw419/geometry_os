; DESCRIPTION: Creates a purple rectangular region at (149, 58) spanning 81 by 47 pixels.
; PLAN: r0=149(x), r1=58(y), r2=81(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 58
LDI r2, 81
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
