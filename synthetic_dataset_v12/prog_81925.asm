; DESCRIPTION: Creates a purple rectangular region at (22, 189) spanning 15 by 59 pixels.
; PLAN: r0=22(x), r1=189(y), r2=15(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 189
LDI r2, 15
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
