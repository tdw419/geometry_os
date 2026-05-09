; DESCRIPTION: Renders a white box of size 25x41 starting at (166, 146).
; PLAN: r0=166(x), r1=146(y), r2=25(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 146
LDI r2, 25
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
