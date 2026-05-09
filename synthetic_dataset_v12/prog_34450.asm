; DESCRIPTION: Draws a cyan line from (277, 147) to (22, 46).
; PLAN: r0=277(x1), r1=147(y1), r2=22(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 147
LDI r2, 22
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
