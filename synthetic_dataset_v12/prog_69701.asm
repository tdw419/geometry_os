; DESCRIPTION: Draws a cyan line from (378, 64) to (141, 85).
; PLAN: r0=378(x1), r1=64(y1), r2=141(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 64
LDI r2, 141
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
