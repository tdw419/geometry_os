; DESCRIPTION: Places a yellow 35x89 rectangle at position (293, 98).
; PLAN: r0=293(x), r1=98(y), r2=35(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 98
LDI r2, 35
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
