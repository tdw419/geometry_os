; DESCRIPTION: Places a green 90x51 rectangle at position (147, 4).
; PLAN: r0=147(x), r1=4(y), r2=90(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 4
LDI r2, 90
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
