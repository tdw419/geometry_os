; DESCRIPTION: Renders a black box of size 31x78 starting at (180, 36).
; PLAN: r0=180(x), r1=36(y), r2=31(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 36
LDI r2, 31
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
