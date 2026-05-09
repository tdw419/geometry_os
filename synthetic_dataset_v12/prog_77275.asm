; DESCRIPTION: Places a green 118x16 rectangle at position (26, 109).
; PLAN: r0=26(x), r1=109(y), r2=118(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 109
LDI r2, 118
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
