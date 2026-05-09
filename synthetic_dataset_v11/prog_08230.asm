; DESCRIPTION: Creates a purple rectangular region at (175, 12) spanning 41 by 70 pixels.
; PLAN: r0=175(x), r1=12(y), r2=41(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 12
LDI r2, 41
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
