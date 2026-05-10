; DESCRIPTION: Places a blue 117x76 box at position (83, 193).
; PLAN: r0=83(x), r1=193(y), r2=117(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 193
LDI r2, 117
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
