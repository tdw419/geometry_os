; DESCRIPTION: Places a black 70x98 rectangle at position (145, 110).
; PLAN: r0=145(x), r1=110(y), r2=70(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 110
LDI r2, 70
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
