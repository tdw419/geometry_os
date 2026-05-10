; DESCRIPTION: Renders a purple box of size 64x52 starting at (142, 111).
; PLAN: r0=142(x), r1=111(y), r2=64(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 111
LDI r2, 64
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
