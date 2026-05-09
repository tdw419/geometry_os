; DESCRIPTION: Creates a purple rectangular region at (146, 167) spanning 78 by 18 pixels.
; PLAN: r0=146(x), r1=167(y), r2=78(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 167
LDI r2, 78
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
