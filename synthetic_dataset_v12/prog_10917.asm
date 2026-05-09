; DESCRIPTION: Renders a yellow box of size 46x38 starting at (105, 44).
; PLAN: r0=105(x), r1=44(y), r2=46(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 44
LDI r2, 46
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
