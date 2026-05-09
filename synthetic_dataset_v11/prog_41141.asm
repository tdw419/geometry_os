; DESCRIPTION: Places a black 25x77 rectangle at position (132, 110).
; PLAN: r0=132(x), r1=110(y), r2=25(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 110
LDI r2, 25
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
