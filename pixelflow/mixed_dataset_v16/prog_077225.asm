; DESCRIPTION: Places a cyan 83x109 box at position (390, 107).
; PLAN: r0=390(x), r1=107(y), r2=83(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 107
LDI r2, 83
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
