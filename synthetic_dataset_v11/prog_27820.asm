; DESCRIPTION: Creates a cyan rectangular region at (113, 103) spanning 41 by 18 pixels.
; PLAN: r0=113(x), r1=103(y), r2=41(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 103
LDI r2, 41
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
