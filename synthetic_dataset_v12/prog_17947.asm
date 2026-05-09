; DESCRIPTION: Places a yellow 78x41 rectangle at position (236, 29).
; PLAN: r0=236(x), r1=29(y), r2=78(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 29
LDI r2, 78
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
