; DESCRIPTION: Creates a blue rectangular region at (171, 148) spanning 12 by 39 pixels.
; PLAN: r0=171(x), r1=148(y), r2=12(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 148
LDI r2, 12
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
