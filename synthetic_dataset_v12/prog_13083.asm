; DESCRIPTION: Places a black 10x87 rectangle at position (388, 19).
; PLAN: r0=388(x), r1=19(y), r2=10(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 19
LDI r2, 10
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
