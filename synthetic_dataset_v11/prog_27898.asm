; DESCRIPTION: Creates a cyan rectangular region at (108, 4) spanning 108 by 41 pixels.
; PLAN: r0=108(x), r1=4(y), r2=108(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 4
LDI r2, 108
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
