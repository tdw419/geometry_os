; DESCRIPTION: Creates a blue rectangular region at (123, 141) spanning 100 by 45 pixels.
; PLAN: r0=123(x), r1=141(y), r2=100(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 141
LDI r2, 100
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
