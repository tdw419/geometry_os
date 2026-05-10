; DESCRIPTION: Places a green 69x31 rectangle at position (41, 96).
; PLAN: r0=41(x), r1=96(y), r2=69(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 96
LDI r2, 69
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
