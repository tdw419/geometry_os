; DESCRIPTION: Places a red 59x10 rectangle at position (34, 41).
; PLAN: r0=34(x), r1=41(y), r2=59(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 41
LDI r2, 59
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
