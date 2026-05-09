; DESCRIPTION: Draws a red line from (86, 58) to (154, 104).
; PLAN: r0=86(x1), r1=58(y1), r2=154(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 58
LDI r2, 154
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
