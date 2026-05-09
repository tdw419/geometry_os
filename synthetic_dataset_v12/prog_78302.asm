; DESCRIPTION: Places a green 117x92 rectangle at position (41, 124).
; PLAN: r0=41(x), r1=124(y), r2=117(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 124
LDI r2, 117
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
