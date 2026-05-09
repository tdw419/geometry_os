; DESCRIPTION: Creates a purple rectangular region at (17, 84) spanning 32 by 79 pixels.
; PLAN: r0=17(x), r1=84(y), r2=32(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 84
LDI r2, 32
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
