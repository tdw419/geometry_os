; DESCRIPTION: Draws a cyan line from (441, 161) to (275, 251).
; PLAN: r0=441(x1), r1=161(y1), r2=275(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 161
LDI r2, 275
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
