; DESCRIPTION: Creates a blue rectangular region at (433, 46) spanning 58 by 67 pixels.
; PLAN: r0=433(x), r1=46(y), r2=58(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 46
LDI r2, 58
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
