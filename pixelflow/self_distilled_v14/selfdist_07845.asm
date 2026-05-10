; DESCRIPTION: Places a yellow 86x81 box at position (260, 141).
; PLAN: r0=260(x), r1=141(y), r2=86(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 141
LDI r2, 86
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
