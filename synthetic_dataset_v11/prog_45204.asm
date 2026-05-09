; DESCRIPTION: Renders a yellow box of size 101x28 starting at (19, 187).
; PLAN: r0=19(x), r1=187(y), r2=101(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 187
LDI r2, 101
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
