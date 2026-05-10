; DESCRIPTION: Places a cyan 40x109 box at position (319, 183).
; PLAN: r0=319(x), r1=183(y), r2=40(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 183
LDI r2, 40
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
