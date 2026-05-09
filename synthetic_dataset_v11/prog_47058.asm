; DESCRIPTION: Renders a purple box of size 110x45 starting at (52, 111).
; PLAN: r0=52(x), r1=111(y), r2=110(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 111
LDI r2, 110
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
