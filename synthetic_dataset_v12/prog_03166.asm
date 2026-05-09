; DESCRIPTION: Renders a yellow box of size 113x19 starting at (343, 222).
; PLAN: r0=343(x), r1=222(y), r2=113(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 222
LDI r2, 113
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
