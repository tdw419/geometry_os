; DESCRIPTION: Draws a cyan line from (378, 136) to (309, 173).
; PLAN: r0=378(x1), r1=136(y1), r2=309(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 136
LDI r2, 309
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
