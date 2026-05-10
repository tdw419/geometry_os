; DESCRIPTION: Draws a cyan line from (199, 40) to (153, 58).
; PLAN: r0=199(x1), r1=40(y1), r2=153(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 40
LDI r2, 153
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
