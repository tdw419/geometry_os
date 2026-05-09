; DESCRIPTION: Places a yellow 11x108 rectangle at position (111, 76).
; PLAN: r0=111(x), r1=76(y), r2=11(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 76
LDI r2, 11
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
