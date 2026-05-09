; DESCRIPTION: Renders a black box of size 83x120 starting at (67, 107).
; PLAN: r0=67(x), r1=107(y), r2=83(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 107
LDI r2, 83
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
