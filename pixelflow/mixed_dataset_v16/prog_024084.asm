; DESCRIPTION: Draws a green line from (34, 236) to (242, 217).
; PLAN: r0=34(x1), r1=236(y1), r2=242(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 236
LDI r2, 242
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
