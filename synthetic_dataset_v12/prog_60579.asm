; DESCRIPTION: Creates a purple rectangular region at (264, 79) spanning 14 by 73 pixels.
; PLAN: r0=264(x), r1=79(y), r2=14(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 79
LDI r2, 14
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
