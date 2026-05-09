; DESCRIPTION: Places a yellow 51x73 rectangle at position (222, 157).
; PLAN: r0=222(x), r1=157(y), r2=51(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 157
LDI r2, 51
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
