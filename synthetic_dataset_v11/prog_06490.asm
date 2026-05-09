; DESCRIPTION: Composite: . Then Draws a purple line from (135, 199) to (97, 231). Then Places a green dot at position (179, 164).
; PLAN: r0=135(x1), r1=199(y1), r2=97(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=179(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (135, 199) to (97, 231).
; PLAN: r0=135(x1), r1=199(y1), r2=97(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 199
LDI r2, 97
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (179, 164).
; PLAN: r0=179(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
