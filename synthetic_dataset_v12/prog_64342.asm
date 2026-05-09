; DESCRIPTION: Draws a cyan line from (237, 107) to (378, 92).
; PLAN: r0=237(x1), r1=107(y1), r2=378(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 107
LDI r2, 378
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
