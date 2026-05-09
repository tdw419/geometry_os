; DESCRIPTION: Creates a blue rectangular region at (234, 215) spanning 102 by 22 pixels.
; PLAN: r0=234(x), r1=215(y), r2=102(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 215
LDI r2, 102
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
