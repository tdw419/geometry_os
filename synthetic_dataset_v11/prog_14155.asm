; DESCRIPTION: Composite: . Then Places a white line segment connecting (203, 135) to (7, 105). Then Creates a purple rectangular region at (86, 35) spanning 14 by 71 pixels.
; PLAN: r0=203(x1), r1=135(y1), r2=7(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=35(y), r2=14(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (203, 135) to (7, 105).
; PLAN: r0=203(x1), r1=135(y1), r2=7(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 135
LDI r2, 7
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (86, 35) spanning 14 by 71 pixels.
; PLAN: r0=86(x), r1=35(y), r2=14(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 35
LDI r2, 14
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
