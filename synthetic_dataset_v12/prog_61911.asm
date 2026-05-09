; DESCRIPTION: Places a green 89x62 rectangle at position (162, 190).
; PLAN: r0=162(x), r1=190(y), r2=89(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 190
LDI r2, 89
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
