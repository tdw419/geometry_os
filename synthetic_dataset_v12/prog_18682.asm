; DESCRIPTION: Places a yellow 41x108 rectangle at position (134, 73).
; PLAN: r0=134(x), r1=73(y), r2=41(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 73
LDI r2, 41
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
