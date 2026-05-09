; DESCRIPTION: Creates a cyan rectangular region at (41, 112) spanning 119 by 81 pixels.
; PLAN: r0=41(x), r1=112(y), r2=119(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 112
LDI r2, 119
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
