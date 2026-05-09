; DESCRIPTION: Creates a purple rectangular region at (77, 219) spanning 59 by 21 pixels.
; PLAN: r0=77(x), r1=219(y), r2=59(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 219
LDI r2, 59
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
