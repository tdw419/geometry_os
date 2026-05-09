; DESCRIPTION: Renders a yellow box of size 71x105 starting at (19, 132).
; PLAN: r0=19(x), r1=132(y), r2=71(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 132
LDI r2, 71
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
