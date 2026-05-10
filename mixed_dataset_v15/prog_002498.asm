; DESCRIPTION: Draws a cyan line from (330, 155) to (110, 176).
; PLAN: r0=330(x1), r1=155(y1), r2=110(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 155
LDI r2, 110
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
