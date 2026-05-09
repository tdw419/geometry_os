; DESCRIPTION: Places a green 118x35 rectangle at position (120, 207).
; PLAN: r0=120(x), r1=207(y), r2=118(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 207
LDI r2, 118
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
