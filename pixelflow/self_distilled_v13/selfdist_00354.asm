; DESCRIPTION: Places a white 50x51 box at position (205, 168).
; PLAN: r0=205(x), r1=168(y), r2=50(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 168
LDI r2, 50
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
