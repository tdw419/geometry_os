; DESCRIPTION: Places a blue 102x94 rectangle at position (223, 66).
; PLAN: r0=223(x), r1=66(y), r2=102(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 66
LDI r2, 102
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
