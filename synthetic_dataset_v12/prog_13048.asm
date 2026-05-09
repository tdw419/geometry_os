; DESCRIPTION: Places a green 43x78 rectangle at position (113, 145).
; PLAN: r0=113(x), r1=145(y), r2=43(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 145
LDI r2, 43
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
