; DESCRIPTION: Creates a blue rectangular region at (68, 111) spanning 67 by 72 pixels.
; PLAN: r0=68(x), r1=111(y), r2=67(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 111
LDI r2, 67
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
