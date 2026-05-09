; DESCRIPTION: Composite: . Then Draws a magenta line from (185, 141) to (163, 246). Then Places a cyan dot at position (128, 236).
; PLAN: r0=185(x1), r1=141(y1), r2=163(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (185, 141) to (163, 246).
; PLAN: r0=185(x1), r1=141(y1), r2=163(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 141
LDI r2, 163
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (128, 236).
; PLAN: r0=128(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
