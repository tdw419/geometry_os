; DESCRIPTION: Draws a green line from (146, 92) to (211, 170).
; PLAN: r0=146(x1), r1=92(y1), r2=211(x2), r3=170(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 92
LDI r2, 211
LDI r3, 170
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
