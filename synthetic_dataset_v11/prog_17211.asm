; DESCRIPTION: Draws a cyan line from (34, 206) to (153, 251).
; PLAN: r0=34(x1), r1=206(y1), r2=153(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 206
LDI r2, 153
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
