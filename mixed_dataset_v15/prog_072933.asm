; DESCRIPTION: Places a yellow 41x41 rectangle at position (176, 14).
; PLAN: r0=176(x), r1=14(y), r2=41(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 14
LDI r2, 41
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
