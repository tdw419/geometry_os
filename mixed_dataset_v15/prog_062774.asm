; DESCRIPTION: Creates a blue rectangular region at (2, 170) spanning 59 by 77 pixels.
; PLAN: r0=2(x), r1=170(y), r2=59(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 170
LDI r2, 59
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
