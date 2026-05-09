; DESCRIPTION: Renders a yellow box of size 44x108 starting at (61, 4).
; PLAN: r0=61(x), r1=4(y), r2=44(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 4
LDI r2, 44
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
