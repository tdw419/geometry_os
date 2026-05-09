; DESCRIPTION: Creates a blue rectangular region at (17, 108) spanning 79 by 47 pixels.
; PLAN: r0=17(x), r1=108(y), r2=79(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 108
LDI r2, 79
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
