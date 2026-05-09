; DESCRIPTION: Renders a purple box of size 117x27 starting at (97, 111).
; PLAN: r0=97(x), r1=111(y), r2=117(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 111
LDI r2, 117
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
