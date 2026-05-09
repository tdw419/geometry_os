; DESCRIPTION: Draws a green line from (4, 248) to (104, 195).
; PLAN: r0=4(x1), r1=248(y1), r2=104(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 248
LDI r2, 104
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
