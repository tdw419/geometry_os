; DESCRIPTION: Renders a black box of size 21x24 starting at (319, 22).
; PLAN: r0=319(x), r1=22(y), r2=21(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 22
LDI r2, 21
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
