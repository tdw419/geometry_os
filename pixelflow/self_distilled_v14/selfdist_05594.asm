; DESCRIPTION: Places a yellow 75x51 box at position (57, 184).
; PLAN: r0=57(x), r1=184(y), r2=75(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 184
LDI r2, 75
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
