; DESCRIPTION: Creates a cyan rectangular region at (103, 56) spanning 49 by 41 pixels.
; PLAN: r0=103(x), r1=56(y), r2=49(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 56
LDI r2, 49
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
