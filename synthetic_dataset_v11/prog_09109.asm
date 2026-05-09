; DESCRIPTION: Creates a blue rectangular region at (35, 234) spanning 45 by 20 pixels.
; PLAN: r0=35(x), r1=234(y), r2=45(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 234
LDI r2, 45
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
