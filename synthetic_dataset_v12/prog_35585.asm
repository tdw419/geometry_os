; DESCRIPTION: Places a cyan 94x118 rectangle at position (227, 57).
; PLAN: r0=227(x), r1=57(y), r2=94(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 57
LDI r2, 94
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
