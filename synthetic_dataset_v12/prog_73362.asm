; DESCRIPTION: Places a cyan 47x62 rectangle at position (89, 148).
; PLAN: r0=89(x), r1=148(y), r2=47(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 148
LDI r2, 47
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
