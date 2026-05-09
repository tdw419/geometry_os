; DESCRIPTION: Places a red 98x41 rectangle at position (29, 116).
; PLAN: r0=29(x), r1=116(y), r2=98(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 116
LDI r2, 98
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
