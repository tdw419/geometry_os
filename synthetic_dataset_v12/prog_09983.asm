; DESCRIPTION: Creates a purple rectangular region at (274, 113) spanning 26 by 117 pixels.
; PLAN: r0=274(x), r1=113(y), r2=26(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 113
LDI r2, 26
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
