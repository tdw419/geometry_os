; DESCRIPTION: Draws a cyan line from (225, 83) to (223, 37).
; PLAN: r0=225(x1), r1=83(y1), r2=223(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 83
LDI r2, 223
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
