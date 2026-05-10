; DESCRIPTION: Creates a blue rectangular region at (394, 185) spanning 19 by 29 pixels.
; PLAN: r0=394(x), r1=185(y), r2=19(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 185
LDI r2, 19
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
