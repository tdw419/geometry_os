; DESCRIPTION: Renders a black box of size 40x47 starting at (104, 29).
; PLAN: r0=104(x), r1=29(y), r2=40(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 29
LDI r2, 40
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
