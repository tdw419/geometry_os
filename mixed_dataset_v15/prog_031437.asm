; DESCRIPTION: Renders a yellow box of size 99x14 starting at (322, 223).
; PLAN: r0=322(x), r1=223(y), r2=99(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 223
LDI r2, 99
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
