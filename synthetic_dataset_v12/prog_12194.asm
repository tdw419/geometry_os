; DESCRIPTION: Draws a cyan line from (225, 227) to (15, 29).
; PLAN: r0=225(x1), r1=227(y1), r2=15(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 227
LDI r2, 15
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
