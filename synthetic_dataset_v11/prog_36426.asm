; DESCRIPTION: Places a black 115x75 rectangle at position (87, 83).
; PLAN: r0=87(x), r1=83(y), r2=115(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 83
LDI r2, 115
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
