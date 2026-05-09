; DESCRIPTION: Creates a blue rectangular region at (158, 146) spanning 41 by 37 pixels.
; PLAN: r0=158(x), r1=146(y), r2=41(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 146
LDI r2, 41
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
