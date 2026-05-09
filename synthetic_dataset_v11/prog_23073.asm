; DESCRIPTION: Draws a green line from (109, 104) to (113, 44).
; PLAN: r0=109(x1), r1=104(y1), r2=113(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 104
LDI r2, 113
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
