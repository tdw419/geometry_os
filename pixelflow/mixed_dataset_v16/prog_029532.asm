; DESCRIPTION: Places a yellow 14x55 rectangle at position (266, 140).
; PLAN: r0=266(x), r1=140(y), r2=14(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 140
LDI r2, 14
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
