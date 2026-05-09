; DESCRIPTION: Renders a yellow box of size 33x19 starting at (105, 226).
; PLAN: r0=105(x), r1=226(y), r2=33(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 226
LDI r2, 33
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
