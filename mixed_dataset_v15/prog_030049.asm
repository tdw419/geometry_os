; DESCRIPTION: Creates a purple rectangular region at (108, 124) spanning 113 by 91 pixels.
; PLAN: r0=108(x), r1=124(y), r2=113(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 124
LDI r2, 113
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
