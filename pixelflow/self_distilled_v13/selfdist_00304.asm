; DESCRIPTION: Places a white 56x51 box at position (181, 15).
; PLAN: r0=181(x), r1=15(y), r2=56(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 15
LDI r2, 56
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
