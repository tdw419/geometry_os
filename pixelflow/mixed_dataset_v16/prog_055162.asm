; DESCRIPTION: Renders a blue box of size 31x109 starting at (37, 107).
; PLAN: r0=37(x), r1=107(y), r2=31(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 107
LDI r2, 31
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
