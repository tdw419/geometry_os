; DESCRIPTION: Draws a cyan line from (436, 22) to (363, 89).
; PLAN: r0=436(x1), r1=22(y1), r2=363(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 22
LDI r2, 363
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
