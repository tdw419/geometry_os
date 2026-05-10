; DESCRIPTION: Creates a cyan rectangular region at (231, 41) spanning 114 by 58 pixels.
; PLAN: r0=231(x), r1=41(y), r2=114(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 41
LDI r2, 114
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
