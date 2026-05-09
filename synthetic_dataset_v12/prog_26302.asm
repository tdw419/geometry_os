; DESCRIPTION: Renders a white box of size 90x41 starting at (300, 214).
; PLAN: r0=300(x), r1=214(y), r2=90(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 214
LDI r2, 90
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
