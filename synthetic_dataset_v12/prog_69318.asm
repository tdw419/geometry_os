; DESCRIPTION: Creates a cyan rectangular region at (41, 91) spanning 113 by 90 pixels.
; PLAN: r0=41(x), r1=91(y), r2=113(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 91
LDI r2, 113
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
