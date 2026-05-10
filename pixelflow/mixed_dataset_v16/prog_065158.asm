; DESCRIPTION: Renders a yellow box of size 93x113 starting at (287, 141).
; PLAN: r0=287(x), r1=141(y), r2=93(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 141
LDI r2, 93
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
