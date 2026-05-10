; DESCRIPTION: Renders a black box of size 25x120 starting at (83, 111).
; PLAN: r0=83(x), r1=111(y), r2=25(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 111
LDI r2, 25
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
