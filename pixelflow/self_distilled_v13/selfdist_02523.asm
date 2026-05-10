; DESCRIPTION: Places a yellow 93x112 box at position (323, 43).
; PLAN: r0=323(x), r1=43(y), r2=93(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 43
LDI r2, 93
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
