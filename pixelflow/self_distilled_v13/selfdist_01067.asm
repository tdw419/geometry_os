; DESCRIPTION: Places a blue 12x94 box at position (116, 86).
; PLAN: r0=116(x), r1=86(y), r2=12(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 86
LDI r2, 12
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
