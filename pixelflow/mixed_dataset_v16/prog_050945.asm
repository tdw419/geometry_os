; DESCRIPTION: Places a green 70x78 rectangle at position (385, 105).
; PLAN: r0=385(x), r1=105(y), r2=70(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 105
LDI r2, 70
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
