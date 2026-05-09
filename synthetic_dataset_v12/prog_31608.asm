; DESCRIPTION: Creates a cyan rectangular region at (41, 90) spanning 115 by 85 pixels.
; PLAN: r0=41(x), r1=90(y), r2=115(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 90
LDI r2, 115
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
