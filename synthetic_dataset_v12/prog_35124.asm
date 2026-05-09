; DESCRIPTION: Places a white 45x41 rectangle at position (157, 121).
; PLAN: r0=157(x), r1=121(y), r2=45(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 121
LDI r2, 45
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
