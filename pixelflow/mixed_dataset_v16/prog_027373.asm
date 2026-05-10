; DESCRIPTION: Renders a black box of size 14x57 starting at (406, 111).
; PLAN: r0=406(x), r1=111(y), r2=14(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 111
LDI r2, 14
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
