; DESCRIPTION: Creates a blue rectangular region at (163, 142) spanning 39 by 59 pixels.
; PLAN: r0=163(x), r1=142(y), r2=39(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 142
LDI r2, 39
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
