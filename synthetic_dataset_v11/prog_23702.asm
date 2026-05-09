; DESCRIPTION: Places a yellow 76x85 rectangle at position (171, 41).
; PLAN: r0=171(x), r1=41(y), r2=76(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 41
LDI r2, 76
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
