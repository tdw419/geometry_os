; DESCRIPTION: Creates a blue rectangular region at (400, 164) spanning 53 by 67 pixels.
; PLAN: r0=400(x), r1=164(y), r2=53(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 164
LDI r2, 53
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
