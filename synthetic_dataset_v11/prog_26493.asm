; DESCRIPTION: Composite: . Then Draws a cyan line from (124, 192) to (21, 4). Then Places a red dot at position (163, 231).
; PLAN: r0=124(x1), r1=192(y1), r2=21(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=163(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (124, 192) to (21, 4).
; PLAN: r0=124(x1), r1=192(y1), r2=21(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 192
LDI r2, 21
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (163, 231).
; PLAN: r0=163(x), r1=231(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 231
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
