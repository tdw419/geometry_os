; DESCRIPTION: Places a blue 23x115 rectangle at position (51, 37).
; PLAN: r0=51(x), r1=37(y), r2=23(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 37
LDI r2, 23
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
