; DESCRIPTION: Renders a black box of size 29x41 starting at (170, 111).
; PLAN: r0=170(x), r1=111(y), r2=29(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 111
LDI r2, 29
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
