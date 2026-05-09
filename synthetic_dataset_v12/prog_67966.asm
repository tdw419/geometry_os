; DESCRIPTION: Renders a yellow box of size 111x104 starting at (353, 49).
; PLAN: r0=353(x), r1=49(y), r2=111(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 49
LDI r2, 111
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
