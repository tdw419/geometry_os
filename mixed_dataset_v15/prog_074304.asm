; DESCRIPTION: Creates a purple rectangular region at (369, 99) spanning 73 by 109 pixels.
; PLAN: r0=369(x), r1=99(y), r2=73(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 99
LDI r2, 73
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
