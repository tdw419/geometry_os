; DESCRIPTION: Places a red 12x106 box at position (125, 126).
; PLAN: r0=125(x), r1=126(y), r2=12(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 126
LDI r2, 12
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
