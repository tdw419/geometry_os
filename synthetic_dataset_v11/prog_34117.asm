; DESCRIPTION: Draws a cyan line from (207, 230) to (162, 147).
; PLAN: r0=207(x1), r1=230(y1), r2=162(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 230
LDI r2, 162
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
