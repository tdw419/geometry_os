; DESCRIPTION: Renders a black box of size 107x110 starting at (380, 49).
; PLAN: r0=380(x), r1=49(y), r2=107(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 49
LDI r2, 107
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
