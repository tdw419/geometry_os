; DESCRIPTION: Places a yellow 51x77 rectangle at position (181, 74).
; PLAN: r0=181(x), r1=74(y), r2=51(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 74
LDI r2, 51
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
