; DESCRIPTION: Draws a cyan line from (129, 85) to (104, 198).
; PLAN: r0=129(x1), r1=85(y1), r2=104(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 85
LDI r2, 104
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
