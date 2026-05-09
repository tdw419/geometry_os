; DESCRIPTION: Draws a green line from (248, 96) to (39, 58).
; PLAN: r0=248(x1), r1=96(y1), r2=39(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 96
LDI r2, 39
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
