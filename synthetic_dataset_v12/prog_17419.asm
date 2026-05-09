; DESCRIPTION: Creates a blue rectangular region at (39, 171) spanning 39 by 62 pixels.
; PLAN: r0=39(x), r1=171(y), r2=39(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 171
LDI r2, 39
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
