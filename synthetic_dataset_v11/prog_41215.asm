; DESCRIPTION: Creates a blue rectangular region at (106, 59) spanning 90 by 72 pixels.
; PLAN: r0=106(x), r1=59(y), r2=90(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 59
LDI r2, 90
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
