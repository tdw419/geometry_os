; DESCRIPTION: Creates a blue rectangular region at (206, 67) spanning 103 by 55 pixels.
; PLAN: r0=206(x), r1=67(y), r2=103(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 67
LDI r2, 103
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
