; DESCRIPTION: Places a green 120x114 rectangle at position (215, 41).
; PLAN: r0=215(x), r1=41(y), r2=120(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 41
LDI r2, 120
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
