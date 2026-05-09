; DESCRIPTION: Creates a white rectangular region at (374, 20) spanning 41 by 73 pixels.
; PLAN: r0=374(x), r1=20(y), r2=41(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 20
LDI r2, 41
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
