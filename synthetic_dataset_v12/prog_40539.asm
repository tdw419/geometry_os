; DESCRIPTION: Places a red 24x41 rectangle at position (309, 130).
; PLAN: r0=309(x), r1=130(y), r2=24(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 130
LDI r2, 24
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
