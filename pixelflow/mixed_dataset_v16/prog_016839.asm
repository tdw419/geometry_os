; DESCRIPTION: Places a yellow 119x46 rectangle at position (321, 98).
; PLAN: r0=321(x), r1=98(y), r2=119(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 98
LDI r2, 119
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
