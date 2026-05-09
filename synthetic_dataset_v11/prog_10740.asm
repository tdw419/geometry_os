; DESCRIPTION: Places a yellow 67x41 rectangle at position (33, 40).
; PLAN: r0=33(x), r1=40(y), r2=67(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 40
LDI r2, 67
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
