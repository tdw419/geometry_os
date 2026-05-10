; DESCRIPTION: Creates a blue rectangular region at (312, 131) spanning 46 by 83 pixels.
; PLAN: r0=312(x), r1=131(y), r2=46(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 131
LDI r2, 46
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
