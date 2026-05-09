; DESCRIPTION: Places a red 60x61 rectangle at position (133, 41).
; PLAN: r0=133(x), r1=41(y), r2=60(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 41
LDI r2, 60
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
