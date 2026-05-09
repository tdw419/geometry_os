; DESCRIPTION: Renders a black box of size 104x110 starting at (67, 141).
; PLAN: r0=67(x), r1=141(y), r2=104(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 141
LDI r2, 104
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
