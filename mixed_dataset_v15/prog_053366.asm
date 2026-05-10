; DESCRIPTION: Places a black 60x46 rectangle at position (32, 110).
; PLAN: r0=32(x), r1=110(y), r2=60(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 110
LDI r2, 60
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
