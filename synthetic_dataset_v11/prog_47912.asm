; DESCRIPTION: Places a cyan 118x36 rectangle at position (17, 47).
; PLAN: r0=17(x), r1=47(y), r2=118(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 47
LDI r2, 118
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
