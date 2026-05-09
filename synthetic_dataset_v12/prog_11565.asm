; DESCRIPTION: Renders a white box of size 89x41 starting at (380, 111).
; PLAN: r0=380(x), r1=111(y), r2=89(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 111
LDI r2, 89
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
