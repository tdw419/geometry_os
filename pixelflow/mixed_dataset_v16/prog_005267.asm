; DESCRIPTION: Renders a black box of size 95x116 starting at (286, 111).
; PLAN: r0=286(x), r1=111(y), r2=95(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 111
LDI r2, 95
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
