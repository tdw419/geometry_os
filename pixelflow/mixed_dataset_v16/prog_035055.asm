; DESCRIPTION: Creates a cyan rectangular region at (282, 41) spanning 22 by 46 pixels.
; PLAN: r0=282(x), r1=41(y), r2=22(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 41
LDI r2, 22
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
