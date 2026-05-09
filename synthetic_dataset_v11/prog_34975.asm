; DESCRIPTION: Places a green 118x26 rectangle at position (38, 79).
; PLAN: r0=38(x), r1=79(y), r2=118(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 79
LDI r2, 118
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
