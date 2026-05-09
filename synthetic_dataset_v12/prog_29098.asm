; DESCRIPTION: Creates a blue rectangular region at (102, 96) spanning 41 by 68 pixels.
; PLAN: r0=102(x), r1=96(y), r2=41(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 96
LDI r2, 41
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
