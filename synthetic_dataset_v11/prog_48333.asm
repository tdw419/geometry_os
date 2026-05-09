; DESCRIPTION: Renders a yellow box of size 46x74 starting at (153, 159).
; PLAN: r0=153(x), r1=159(y), r2=46(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 159
LDI r2, 46
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
