; DESCRIPTION: Creates a blue rectangular region at (200, 148) spanning 67 by 95 pixels.
; PLAN: r0=200(x), r1=148(y), r2=67(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 148
LDI r2, 67
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
