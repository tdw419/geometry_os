; DESCRIPTION: Draws a green line from (387, 207) to (22, 144).
; PLAN: r0=387(x1), r1=207(y1), r2=22(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 207
LDI r2, 22
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
