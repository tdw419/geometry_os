; DESCRIPTION: Places a green 96x68 rectangle at position (155, 26).
; PLAN: r0=155(x), r1=26(y), r2=96(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 26
LDI r2, 96
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
