; DESCRIPTION: Places a yellow 93x23 rectangle at position (41, 227).
; PLAN: r0=41(x), r1=227(y), r2=93(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 227
LDI r2, 93
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
