; DESCRIPTION: Renders a black box of size 90x77 starting at (321, 67).
; PLAN: r0=321(x), r1=67(y), r2=90(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 67
LDI r2, 90
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
