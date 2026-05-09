; DESCRIPTION: Creates a purple rectangular region at (55, 112) spanning 109 by 86 pixels.
; PLAN: r0=55(x), r1=112(y), r2=109(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 112
LDI r2, 109
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
