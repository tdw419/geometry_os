; DESCRIPTION: Renders a yellow box of size 32x29 starting at (26, 111).
; PLAN: r0=26(x), r1=111(y), r2=32(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 111
LDI r2, 32
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
