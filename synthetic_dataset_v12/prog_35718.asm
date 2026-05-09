; DESCRIPTION: Draws a cyan line from (423, 73) to (489, 225).
; PLAN: r0=423(x1), r1=73(y1), r2=489(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 73
LDI r2, 489
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
