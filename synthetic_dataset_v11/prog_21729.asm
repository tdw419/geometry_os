; DESCRIPTION: Creates a purple rectangular region at (146, 170) spanning 18 by 14 pixels.
; PLAN: r0=146(x), r1=170(y), r2=18(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 170
LDI r2, 18
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
