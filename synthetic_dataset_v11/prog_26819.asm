; DESCRIPTION: Places a green 40x41 rectangle at position (134, 158).
; PLAN: r0=134(x), r1=158(y), r2=40(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 158
LDI r2, 40
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
