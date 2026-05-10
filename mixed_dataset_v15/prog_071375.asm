; DESCRIPTION: Places a white 51x55 box at position (211, 97).
; PLAN: r0=211(x), r1=97(y), r2=51(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 97
LDI r2, 51
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
