; DESCRIPTION: Creates a purple rectangular region at (54, 108) spanning 113 by 108 pixels.
; PLAN: r0=54(x), r1=108(y), r2=113(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 108
LDI r2, 113
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
