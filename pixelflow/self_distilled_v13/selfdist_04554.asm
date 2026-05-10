; DESCRIPTION: Draws a red line from (164, 104) to (264, 91).
; PLAN: r0=164(x1), r1=104(y1), r2=264(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 104
LDI r2, 264
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
