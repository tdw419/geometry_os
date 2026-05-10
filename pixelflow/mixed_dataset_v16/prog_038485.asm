; DESCRIPTION: Renders a purple box of size 105x109 starting at (130, 44).
; PLAN: r0=130(x), r1=44(y), r2=105(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 44
LDI r2, 105
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
