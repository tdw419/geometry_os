; DESCRIPTION: Creates a purple rectangular region at (38, 10) spanning 59 by 62 pixels.
; PLAN: r0=38(x), r1=10(y), r2=59(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 10
LDI r2, 59
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
