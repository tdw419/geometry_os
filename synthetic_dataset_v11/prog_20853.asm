; DESCRIPTION: Draws a white line from (96, 104) to (209, 248).
; PLAN: r0=96(x1), r1=104(y1), r2=209(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 104
LDI r2, 209
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
