; DESCRIPTION: Draws a cyan line from (432, 243) to (74, 106).
; PLAN: r0=432(x1), r1=243(y1), r2=74(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 243
LDI r2, 74
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
