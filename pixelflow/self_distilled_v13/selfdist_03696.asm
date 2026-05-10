; DESCRIPTION: Draws a cyan line from (353, 8) to (251, 160).
; PLAN: r0=353(x1), r1=8(y1), r2=251(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 8
LDI r2, 251
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
