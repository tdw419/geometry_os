; DESCRIPTION: Renders a yellow box of size 25x74 starting at (29, 155).
; PLAN: r0=29(x), r1=155(y), r2=25(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 155
LDI r2, 25
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
