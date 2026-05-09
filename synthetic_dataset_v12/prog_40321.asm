; DESCRIPTION: Creates a blue rectangular region at (307, 47) spanning 17 by 67 pixels.
; PLAN: r0=307(x), r1=47(y), r2=17(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 47
LDI r2, 17
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
