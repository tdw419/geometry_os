; DESCRIPTION: Places a purple 41x35 rectangle at position (169, 89).
; PLAN: r0=169(x), r1=89(y), r2=41(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 89
LDI r2, 41
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
