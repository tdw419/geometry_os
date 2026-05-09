; DESCRIPTION: Draws a green line from (103, 92) to (91, 160).
; PLAN: r0=103(x1), r1=92(y1), r2=91(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 92
LDI r2, 91
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
