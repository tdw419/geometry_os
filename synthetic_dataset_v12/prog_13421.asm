; DESCRIPTION: Renders a white box of size 93x41 starting at (231, 14).
; PLAN: r0=231(x), r1=14(y), r2=93(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 14
LDI r2, 93
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
