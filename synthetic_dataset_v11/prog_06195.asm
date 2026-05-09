; DESCRIPTION: Places a green 51x119 rectangle at position (142, 71).
; PLAN: r0=142(x), r1=71(y), r2=51(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 71
LDI r2, 51
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
