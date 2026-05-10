; DESCRIPTION: Renders a black box of size 65x37 starting at (11, 111).
; PLAN: r0=11(x), r1=111(y), r2=65(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 111
LDI r2, 65
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
