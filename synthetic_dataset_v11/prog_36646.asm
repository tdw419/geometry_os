; DESCRIPTION: Places a yellow 51x22 rectangle at position (115, 136).
; PLAN: r0=115(x), r1=136(y), r2=51(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 136
LDI r2, 51
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
