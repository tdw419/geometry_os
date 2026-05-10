; DESCRIPTION: Creates a purple rectangular region at (303, 113) spanning 25 by 77 pixels.
; PLAN: r0=303(x), r1=113(y), r2=25(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 113
LDI r2, 25
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
