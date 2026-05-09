; DESCRIPTION: Places a black 21x27 rectangle at position (457, 49).
; PLAN: r0=457(x), r1=49(y), r2=21(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 49
LDI r2, 21
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
