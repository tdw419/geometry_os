; DESCRIPTION: Creates a blue rectangular region at (301, 21) spanning 116 by 44 pixels.
; PLAN: r0=301(x), r1=21(y), r2=116(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 21
LDI r2, 116
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
