; DESCRIPTION: Places a yellow 78x108 rectangle at position (5, 129).
; PLAN: r0=5(x), r1=129(y), r2=78(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 129
LDI r2, 78
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
