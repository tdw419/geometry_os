; DESCRIPTION: Renders a white box of size 74x14 starting at (51, 111).
; PLAN: r0=51(x), r1=111(y), r2=74(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 111
LDI r2, 74
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
