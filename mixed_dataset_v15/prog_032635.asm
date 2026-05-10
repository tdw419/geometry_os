; DESCRIPTION: Places a red 37x44 box at position (144, 155).
; PLAN: r0=144(x), r1=155(y), r2=37(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 155
LDI r2, 37
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
