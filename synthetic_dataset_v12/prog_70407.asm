; DESCRIPTION: Places a black 101x117 rectangle at position (126, 80).
; PLAN: r0=126(x), r1=80(y), r2=101(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 80
LDI r2, 101
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
