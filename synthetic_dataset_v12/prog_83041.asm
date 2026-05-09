; DESCRIPTION: Creates a purple rectangular region at (300, 55) spanning 79 by 102 pixels.
; PLAN: r0=300(x), r1=55(y), r2=79(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 55
LDI r2, 79
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
