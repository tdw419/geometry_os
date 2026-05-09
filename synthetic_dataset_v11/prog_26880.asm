; DESCRIPTION: Creates a blue rectangular region at (80, 46) spanning 99 by 55 pixels.
; PLAN: r0=80(x), r1=46(y), r2=99(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 99
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
