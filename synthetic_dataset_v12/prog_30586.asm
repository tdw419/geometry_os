; DESCRIPTION: Places a yellow 115x75 rectangle at position (256, 122).
; PLAN: r0=256(x), r1=122(y), r2=115(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 122
LDI r2, 115
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
