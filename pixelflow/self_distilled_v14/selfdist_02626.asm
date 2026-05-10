; DESCRIPTION: Places a green 81x19 box at position (279, 52).
; PLAN: r0=279(x), r1=52(y), r2=81(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 52
LDI r2, 81
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
