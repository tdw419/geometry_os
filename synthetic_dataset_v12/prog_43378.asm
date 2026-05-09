; DESCRIPTION: Creates a purple rectangular region at (162, 141) spanning 111 by 114 pixels.
; PLAN: r0=162(x), r1=141(y), r2=111(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 141
LDI r2, 111
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
