; DESCRIPTION: Creates a purple rectangular region at (99, 108) spanning 59 by 14 pixels.
; PLAN: r0=99(x), r1=108(y), r2=59(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 108
LDI r2, 59
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
