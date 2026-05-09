; DESCRIPTION: Creates a purple rectangular region at (170, 74) spanning 80 by 112 pixels.
; PLAN: r0=170(x), r1=74(y), r2=80(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 74
LDI r2, 80
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
