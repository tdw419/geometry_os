; DESCRIPTION: Creates a blue rectangular region at (426, 176) spanning 79 by 46 pixels.
; PLAN: r0=426(x), r1=176(y), r2=79(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 176
LDI r2, 79
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
