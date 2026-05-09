; DESCRIPTION: Creates a purple rectangular region at (175, 140) spanning 23 by 112 pixels.
; PLAN: r0=175(x), r1=140(y), r2=23(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 23
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
