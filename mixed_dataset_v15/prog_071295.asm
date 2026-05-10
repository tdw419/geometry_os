; DESCRIPTION: Draws a green line from (454, 58) to (307, 161).
; PLAN: r0=454(x1), r1=58(y1), r2=307(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 58
LDI r2, 307
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
