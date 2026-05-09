; DESCRIPTION: Places a cyan 94x36 rectangle at position (26, 49).
; PLAN: r0=26(x), r1=49(y), r2=94(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 49
LDI r2, 94
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
