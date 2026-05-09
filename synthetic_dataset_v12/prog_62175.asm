; DESCRIPTION: Places a yellow 84x53 rectangle at position (41, 22).
; PLAN: r0=41(x), r1=22(y), r2=84(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 22
LDI r2, 84
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
