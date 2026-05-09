; DESCRIPTION: Creates a purple rectangular region at (169, 80) spanning 59 by 18 pixels.
; PLAN: r0=169(x), r1=80(y), r2=59(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 80
LDI r2, 59
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
