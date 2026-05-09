; DESCRIPTION: Creates a purple rectangular region at (103, 43) spanning 35 by 18 pixels.
; PLAN: r0=103(x), r1=43(y), r2=35(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 43
LDI r2, 35
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
