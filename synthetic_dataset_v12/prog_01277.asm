; DESCRIPTION: Places a yellow 29x33 rectangle at position (419, 201).
; PLAN: r0=419(x), r1=201(y), r2=29(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 201
LDI r2, 29
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
