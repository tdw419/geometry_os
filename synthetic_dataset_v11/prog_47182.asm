; DESCRIPTION: Places a yellow 93x85 rectangle at position (41, 86).
; PLAN: r0=41(x), r1=86(y), r2=93(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 86
LDI r2, 93
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
