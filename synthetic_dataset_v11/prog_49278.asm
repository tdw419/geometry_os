; DESCRIPTION: Creates a green rectangular region at (112, 122) spanning 79 by 69 pixels.
; PLAN: r0=112(x), r1=122(y), r2=79(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 122
LDI r2, 79
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
