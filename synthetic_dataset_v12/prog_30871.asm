; DESCRIPTION: Places a black 58x12 rectangle at position (449, 193).
; PLAN: r0=449(x), r1=193(y), r2=58(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 193
LDI r2, 58
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
