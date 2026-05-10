; DESCRIPTION: Creates a blue rectangular region at (482, 59) spanning 23 by 108 pixels.
; PLAN: r0=482(x), r1=59(y), r2=23(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 59
LDI r2, 23
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
