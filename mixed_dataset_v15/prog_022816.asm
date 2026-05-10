; DESCRIPTION: Places a green 118x41 rectangle at position (282, 189).
; PLAN: r0=282(x), r1=189(y), r2=118(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 189
LDI r2, 118
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
