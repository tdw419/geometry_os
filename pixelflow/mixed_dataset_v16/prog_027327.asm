; DESCRIPTION: Places a yellow 102x25 rectangle at position (201, 71).
; PLAN: r0=201(x), r1=71(y), r2=102(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 71
LDI r2, 102
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
