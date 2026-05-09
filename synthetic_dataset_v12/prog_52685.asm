; DESCRIPTION: Places a black 68x23 rectangle at position (36, 43).
; PLAN: r0=36(x), r1=43(y), r2=68(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 43
LDI r2, 68
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
