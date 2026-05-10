; DESCRIPTION: Creates a yellow rectangular region at (237, 141) spanning 33 by 45 pixels.
; PLAN: r0=237(x), r1=141(y), r2=33(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 141
LDI r2, 33
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
