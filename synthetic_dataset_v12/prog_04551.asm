; DESCRIPTION: Renders a green box of size 82x41 starting at (276, 142).
; PLAN: r0=276(x), r1=142(y), r2=82(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 142
LDI r2, 82
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
