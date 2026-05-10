; DESCRIPTION: Places a blue 27x107 box at position (248, 176).
; PLAN: r0=248(x), r1=176(y), r2=27(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 176
LDI r2, 27
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
