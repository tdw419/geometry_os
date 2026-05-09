; DESCRIPTION: Creates a blue rectangular region at (116, 63) spanning 18 by 108 pixels.
; PLAN: r0=116(x), r1=63(y), r2=18(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 18
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
