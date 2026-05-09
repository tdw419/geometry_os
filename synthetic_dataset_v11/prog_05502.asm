; DESCRIPTION: Renders a black box of size 61x41 starting at (164, 207).
; PLAN: r0=164(x), r1=207(y), r2=61(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 207
LDI r2, 61
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
