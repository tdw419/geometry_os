; DESCRIPTION: Places a green 72x105 rectangle at position (147, 97).
; PLAN: r0=147(x), r1=97(y), r2=72(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 97
LDI r2, 72
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
