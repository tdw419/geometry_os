; DESCRIPTION: Places a yellow 89x108 rectangle at position (71, 106).
; PLAN: r0=71(x), r1=106(y), r2=89(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 106
LDI r2, 89
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
