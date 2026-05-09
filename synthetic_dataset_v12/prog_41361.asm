; DESCRIPTION: Renders a yellow box of size 111x112 starting at (102, 111).
; PLAN: r0=102(x), r1=111(y), r2=111(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 111
LDI r2, 111
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
