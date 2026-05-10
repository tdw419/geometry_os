; DESCRIPTION: Draws a yellow line from (470, 60) to (342, 187).
; PLAN: r0=470(x1), r1=60(y1), r2=342(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 60
LDI r2, 342
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
