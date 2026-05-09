; DESCRIPTION: Composite: . Then Places a green dot at position (231, 195). Then Draws a purple line from (143, 35) to (245, 176).
; PLAN: r0=231(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=143(x1), r1=35(y1), r2=245(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (231, 195).
; PLAN: r0=231(x), r1=195(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 195
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (143, 35) to (245, 176).
; PLAN: r0=143(x1), r1=35(y1), r2=245(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 35
LDI r2, 245
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
