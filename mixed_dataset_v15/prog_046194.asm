; DESCRIPTION: Places a red 107x85 box at position (249, 132).
; PLAN: r0=249(x), r1=132(y), r2=107(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 132
LDI r2, 107
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
