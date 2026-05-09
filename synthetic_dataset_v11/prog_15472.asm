; DESCRIPTION: Renders a purple box of size 39x72 starting at (199, 130).
; PLAN: r0=199(x), r1=130(y), r2=39(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 130
LDI r2, 39
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
