; DESCRIPTION: Renders a black box of size 44x117 starting at (73, 29).
; PLAN: r0=73(x), r1=29(y), r2=44(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 29
LDI r2, 44
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
