; DESCRIPTION: Places a black 12x58 rectangle at position (1, 83).
; PLAN: r0=1(x), r1=83(y), r2=12(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 83
LDI r2, 12
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
