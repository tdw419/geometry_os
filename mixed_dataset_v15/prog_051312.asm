; DESCRIPTION: Creates a blue rectangular region at (252, 111) spanning 107 by 69 pixels.
; PLAN: r0=252(x), r1=111(y), r2=107(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 111
LDI r2, 107
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
