; DESCRIPTION: Renders a yellow box of size 49x93 starting at (288, 113).
; PLAN: r0=288(x), r1=113(y), r2=49(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 113
LDI r2, 49
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
