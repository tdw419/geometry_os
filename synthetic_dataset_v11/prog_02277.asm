; DESCRIPTION: Places a red 107x51 rectangle at position (137, 49).
; PLAN: r0=137(x), r1=49(y), r2=107(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 49
LDI r2, 107
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
