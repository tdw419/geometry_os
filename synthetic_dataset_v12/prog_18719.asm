; DESCRIPTION: Draws a red line from (371, 220) to (370, 208).
; PLAN: r0=371(x1), r1=220(y1), r2=370(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 220
LDI r2, 370
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
