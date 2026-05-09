; DESCRIPTION: Places a red 41x11 rectangle at position (47, 68).
; PLAN: r0=47(x), r1=68(y), r2=41(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 68
LDI r2, 41
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
