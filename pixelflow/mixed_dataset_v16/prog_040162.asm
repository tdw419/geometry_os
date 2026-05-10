; DESCRIPTION: Renders a yellow box of size 77x14 starting at (243, 170).
; PLAN: r0=243(x), r1=170(y), r2=77(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 170
LDI r2, 77
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
