; DESCRIPTION: Places a red 59x41 rectangle at position (181, 40).
; PLAN: r0=181(x), r1=40(y), r2=59(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 40
LDI r2, 59
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
