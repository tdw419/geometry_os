; DESCRIPTION: Places a green 38x41 rectangle at position (47, 162).
; PLAN: r0=47(x), r1=162(y), r2=38(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 162
LDI r2, 38
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
