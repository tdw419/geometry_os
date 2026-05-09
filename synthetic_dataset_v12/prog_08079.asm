; DESCRIPTION: Renders a purple box of size 77x117 starting at (252, 111).
; PLAN: r0=252(x), r1=111(y), r2=77(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 111
LDI r2, 77
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
