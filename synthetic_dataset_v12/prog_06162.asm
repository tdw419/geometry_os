; DESCRIPTION: Places a cyan line segment connecting (378, 127) to (44, 42).
; PLAN: r0=378(x1), r1=127(y1), r2=44(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 127
LDI r2, 44
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
