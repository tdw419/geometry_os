; DESCRIPTION: Renders a yellow box of size 59x118 starting at (243, 59).
; PLAN: r0=243(x), r1=59(y), r2=59(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 59
LDI r2, 59
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
