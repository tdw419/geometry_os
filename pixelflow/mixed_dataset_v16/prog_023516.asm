; DESCRIPTION: Creates a blue rectangular region at (28, 5) spanning 59 by 83 pixels.
; PLAN: r0=28(x), r1=5(y), r2=59(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 5
LDI r2, 59
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
