; DESCRIPTION: Places a black 46x54 rectangle at position (201, 74).
; PLAN: r0=201(x), r1=74(y), r2=46(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 74
LDI r2, 46
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
