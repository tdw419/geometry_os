; DESCRIPTION: Places a red 49x51 rectangle at position (53, 98).
; PLAN: r0=53(x), r1=98(y), r2=49(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 98
LDI r2, 49
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
