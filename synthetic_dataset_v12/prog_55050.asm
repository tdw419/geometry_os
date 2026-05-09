; DESCRIPTION: Draws a cyan line from (332, 47) to (483, 79).
; PLAN: r0=332(x1), r1=47(y1), r2=483(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 47
LDI r2, 483
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
