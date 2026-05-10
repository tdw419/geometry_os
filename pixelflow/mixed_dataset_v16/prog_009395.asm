; DESCRIPTION: Creates a cyan rectangular region at (389, 24) spanning 41 by 83 pixels.
; PLAN: r0=389(x), r1=24(y), r2=41(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 24
LDI r2, 41
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
