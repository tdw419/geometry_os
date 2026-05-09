; DESCRIPTION: Places a red 108x41 rectangle at position (41, 167).
; PLAN: r0=41(x), r1=167(y), r2=108(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 167
LDI r2, 108
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
