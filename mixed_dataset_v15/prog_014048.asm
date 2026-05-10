; DESCRIPTION: Renders a black box of size 31x16 starting at (90, 130).
; PLAN: r0=90(x), r1=130(y), r2=31(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 31
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
