; DESCRIPTION: Renders a yellow box of size 43x57 starting at (341, 111).
; PLAN: r0=341(x), r1=111(y), r2=43(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 111
LDI r2, 43
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
