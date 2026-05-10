; DESCRIPTION: Creates a purple rectangular region at (55, 6) spanning 59 by 113 pixels.
; PLAN: r0=55(x), r1=6(y), r2=59(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 6
LDI r2, 59
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
