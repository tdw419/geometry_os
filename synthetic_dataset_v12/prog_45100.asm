; DESCRIPTION: Draws a yellow line from (59, 7) to (82, 104).
; PLAN: r0=59(x1), r1=7(y1), r2=82(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 82
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
