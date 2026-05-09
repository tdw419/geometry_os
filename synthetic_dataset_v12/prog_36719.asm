; DESCRIPTION: Creates a cyan rectangular region at (108, 189) spanning 28 by 41 pixels.
; PLAN: r0=108(x), r1=189(y), r2=28(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 189
LDI r2, 28
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
