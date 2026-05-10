; DESCRIPTION: Renders a black box of size 67x18 starting at (186, 107).
; PLAN: r0=186(x), r1=107(y), r2=67(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 107
LDI r2, 67
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
