; DESCRIPTION: Places a black 52x36 rectangle at position (27, 201).
; PLAN: r0=27(x), r1=201(y), r2=52(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 201
LDI r2, 52
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
