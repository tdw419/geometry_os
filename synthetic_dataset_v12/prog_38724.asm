; DESCRIPTION: Places a yellow 96x51 rectangle at position (49, 131).
; PLAN: r0=49(x), r1=131(y), r2=96(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 131
LDI r2, 96
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
