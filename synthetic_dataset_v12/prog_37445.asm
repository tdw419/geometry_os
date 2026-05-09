; DESCRIPTION: Creates a cyan rectangular region at (24, 41) spanning 11 by 18 pixels.
; PLAN: r0=24(x), r1=41(y), r2=11(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 41
LDI r2, 11
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
