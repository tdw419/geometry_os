; DESCRIPTION: Draws a green line from (474, 104) to (367, 233).
; PLAN: r0=474(x1), r1=104(y1), r2=367(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 104
LDI r2, 367
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
