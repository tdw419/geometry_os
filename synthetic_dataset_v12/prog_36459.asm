; DESCRIPTION: Draws a green line from (192, 104) to (503, 125).
; PLAN: r0=192(x1), r1=104(y1), r2=503(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 104
LDI r2, 503
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
