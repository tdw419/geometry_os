; DESCRIPTION: Places a black 110x20 rectangle at position (52, 129).
; PLAN: r0=52(x), r1=129(y), r2=110(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 129
LDI r2, 110
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
