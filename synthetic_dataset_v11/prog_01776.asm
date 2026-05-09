; DESCRIPTION: Creates a blue rectangular region at (119, 120) spanning 14 by 41 pixels.
; PLAN: r0=119(x), r1=120(y), r2=14(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 120
LDI r2, 14
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
