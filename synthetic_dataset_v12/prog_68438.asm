; DESCRIPTION: Places a orange 46x20 rectangle at position (341, 201).
; PLAN: r0=341(x), r1=201(y), r2=46(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 201
LDI r2, 46
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
