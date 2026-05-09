; DESCRIPTION: Creates a blue rectangular region at (11, 79) spanning 72 by 43 pixels.
; PLAN: r0=11(x), r1=79(y), r2=72(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 79
LDI r2, 72
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
