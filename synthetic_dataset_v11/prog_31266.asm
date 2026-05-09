; DESCRIPTION: Renders a blue box of size 26x88 starting at (137, 111).
; PLAN: r0=137(x), r1=111(y), r2=26(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 111
LDI r2, 26
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
