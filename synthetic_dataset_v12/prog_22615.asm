; DESCRIPTION: Places a yellow 41x67 rectangle at position (380, 171).
; PLAN: r0=380(x), r1=171(y), r2=41(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 171
LDI r2, 41
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
