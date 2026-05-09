; DESCRIPTION: Places a yellow 77x41 rectangle at position (141, 215).
; PLAN: r0=141(x), r1=215(y), r2=77(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 215
LDI r2, 77
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
