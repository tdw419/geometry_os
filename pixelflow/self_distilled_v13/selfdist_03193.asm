; DESCRIPTION: Places a red 43x105 box at position (196, 66).
; PLAN: r0=196(x), r1=66(y), r2=43(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 66
LDI r2, 43
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
