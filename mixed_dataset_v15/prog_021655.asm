; DESCRIPTION: Places a yellow 33x83 rectangle at position (355, 114).
; PLAN: r0=355(x), r1=114(y), r2=33(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 114
LDI r2, 33
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
