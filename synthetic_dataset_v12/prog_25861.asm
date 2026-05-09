; DESCRIPTION: Places a green 60x26 rectangle at position (22, 119).
; PLAN: r0=22(x), r1=119(y), r2=60(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 119
LDI r2, 60
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
