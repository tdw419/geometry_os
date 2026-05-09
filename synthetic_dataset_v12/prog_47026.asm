; DESCRIPTION: Creates a yellow rectangular region at (237, 168) spanning 78 by 69 pixels.
; PLAN: r0=237(x), r1=168(y), r2=78(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 168
LDI r2, 78
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
