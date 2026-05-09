; DESCRIPTION: Creates a blue rectangular region at (218, 134) spanning 96 by 83 pixels.
; PLAN: r0=218(x), r1=134(y), r2=96(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 134
LDI r2, 96
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
