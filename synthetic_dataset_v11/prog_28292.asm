; DESCRIPTION: Places a white 92x43 rectangle at position (2, 201).
; PLAN: r0=2(x), r1=201(y), r2=92(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 201
LDI r2, 92
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
