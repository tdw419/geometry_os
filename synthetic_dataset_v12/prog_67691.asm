; DESCRIPTION: Creates a purple rectangular region at (455, 146) spanning 35 by 25 pixels.
; PLAN: r0=455(x), r1=146(y), r2=35(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 146
LDI r2, 35
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
