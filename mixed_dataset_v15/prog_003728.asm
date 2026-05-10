; DESCRIPTION: Creates a blue rectangular region at (292, 193) spanning 67 by 24 pixels.
; PLAN: r0=292(x), r1=193(y), r2=67(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 193
LDI r2, 67
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
