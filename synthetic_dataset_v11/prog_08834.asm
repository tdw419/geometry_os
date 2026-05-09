; DESCRIPTION: Places a green 41x112 rectangle at position (118, 28).
; PLAN: r0=118(x), r1=28(y), r2=41(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 28
LDI r2, 41
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
