; DESCRIPTION: Creates a yellow rectangular region at (187, 28) spanning 41 by 23 pixels.
; PLAN: r0=187(x), r1=28(y), r2=41(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 28
LDI r2, 41
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
