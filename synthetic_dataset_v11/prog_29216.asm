; DESCRIPTION: Places a red 102x18 rectangle at position (24, 201).
; PLAN: r0=24(x), r1=201(y), r2=102(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 201
LDI r2, 102
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
