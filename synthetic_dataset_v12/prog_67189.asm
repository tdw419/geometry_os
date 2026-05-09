; DESCRIPTION: Creates a cyan rectangular region at (333, 121) spanning 71 by 41 pixels.
; PLAN: r0=333(x), r1=121(y), r2=71(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 121
LDI r2, 71
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
