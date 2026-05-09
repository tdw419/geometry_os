; DESCRIPTION: Creates a blue rectangular region at (17, 79) spanning 16 by 55 pixels.
; PLAN: r0=17(x), r1=79(y), r2=16(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 16
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
