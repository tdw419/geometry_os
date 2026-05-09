; DESCRIPTION: Creates a purple rectangular region at (233, 177) spanning 41 by 40 pixels.
; PLAN: r0=233(x), r1=177(y), r2=41(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 177
LDI r2, 41
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
