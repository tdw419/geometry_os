; DESCRIPTION: Renders a yellow box of size 73x15 starting at (196, 141).
; PLAN: r0=196(x), r1=141(y), r2=73(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 141
LDI r2, 73
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
