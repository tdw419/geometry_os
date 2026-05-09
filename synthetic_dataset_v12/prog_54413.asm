; DESCRIPTION: Places a black 60x80 rectangle at position (87, 131).
; PLAN: r0=87(x), r1=131(y), r2=60(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 131
LDI r2, 60
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
