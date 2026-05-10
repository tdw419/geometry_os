; DESCRIPTION: Draws a cyan line from (423, 141) to (432, 46).
; PLAN: r0=423(x1), r1=141(y1), r2=432(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 141
LDI r2, 432
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
