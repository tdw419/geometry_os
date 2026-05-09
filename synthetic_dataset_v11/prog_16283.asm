; DESCRIPTION: Places a yellow 115x63 rectangle at position (132, 51).
; PLAN: r0=132(x), r1=51(y), r2=115(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 51
LDI r2, 115
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
