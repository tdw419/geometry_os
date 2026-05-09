; DESCRIPTION: Places a black 85x93 rectangle at position (269, 49).
; PLAN: r0=269(x), r1=49(y), r2=85(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 49
LDI r2, 85
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
