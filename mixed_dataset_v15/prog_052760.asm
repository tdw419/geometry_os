; DESCRIPTION: Places a yellow 110x51 box at position (307, 198).
; PLAN: r0=307(x), r1=198(y), r2=110(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 198
LDI r2, 110
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
