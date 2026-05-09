; DESCRIPTION: Places a cyan 95x36 rectangle at position (31, 94).
; PLAN: r0=31(x), r1=94(y), r2=95(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 94
LDI r2, 95
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
