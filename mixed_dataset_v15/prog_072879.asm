; DESCRIPTION: Places a green 36x13 rectangle at position (80, 122).
; PLAN: r0=80(x), r1=122(y), r2=36(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 122
LDI r2, 36
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
