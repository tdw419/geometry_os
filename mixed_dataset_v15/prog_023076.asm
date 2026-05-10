; DESCRIPTION: Places a green 117x84 rectangle at position (185, 37).
; PLAN: r0=185(x), r1=37(y), r2=117(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 37
LDI r2, 117
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
