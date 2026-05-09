; DESCRIPTION: Creates a blue rectangular region at (393, 22) spanning 19 by 117 pixels.
; PLAN: r0=393(x), r1=22(y), r2=19(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 22
LDI r2, 19
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
