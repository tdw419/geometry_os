; DESCRIPTION: Renders a yellow box of size 108x73 starting at (326, 169).
; PLAN: r0=326(x), r1=169(y), r2=108(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 169
LDI r2, 108
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
