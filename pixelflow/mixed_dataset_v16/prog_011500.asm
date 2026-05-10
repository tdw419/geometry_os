; DESCRIPTION: Draws a cyan line from (416, 119) to (89, 223).
; PLAN: r0=416(x1), r1=119(y1), r2=89(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 119
LDI r2, 89
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
