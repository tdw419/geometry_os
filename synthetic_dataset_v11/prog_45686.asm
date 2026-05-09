; DESCRIPTION: Creates a blue rectangular region at (116, 79) spanning 43 by 98 pixels.
; PLAN: r0=116(x), r1=79(y), r2=43(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 79
LDI r2, 43
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
