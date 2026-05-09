; DESCRIPTION: Places a green 28x108 rectangle at position (89, 79).
; PLAN: r0=89(x), r1=79(y), r2=28(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 79
LDI r2, 28
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
