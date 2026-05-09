; DESCRIPTION: Places a yellow 35x17 rectangle at position (24, 51).
; PLAN: r0=24(x), r1=51(y), r2=35(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 51
LDI r2, 35
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
