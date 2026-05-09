; DESCRIPTION: Places a yellow 105x84 rectangle at position (95, 51).
; PLAN: r0=95(x), r1=51(y), r2=105(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 51
LDI r2, 105
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
