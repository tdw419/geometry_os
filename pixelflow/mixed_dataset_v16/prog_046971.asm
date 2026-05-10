; DESCRIPTION: Renders a black box of size 26x88 starting at (460, 111).
; PLAN: r0=460(x), r1=111(y), r2=26(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 111
LDI r2, 26
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
