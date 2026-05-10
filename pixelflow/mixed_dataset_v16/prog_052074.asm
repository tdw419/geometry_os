; DESCRIPTION: Places a cyan 60x22 rectangle at position (155, 137).
; PLAN: r0=155(x), r1=137(y), r2=60(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 137
LDI r2, 60
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
