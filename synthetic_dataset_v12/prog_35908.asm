; DESCRIPTION: Places a black 32x94 rectangle at position (292, 142).
; PLAN: r0=292(x), r1=142(y), r2=32(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 142
LDI r2, 32
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
