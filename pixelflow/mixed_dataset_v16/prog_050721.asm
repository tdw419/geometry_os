; DESCRIPTION: Draws a green line from (465, 207) to (505, 104).
; PLAN: r0=465(x1), r1=207(y1), r2=505(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 207
LDI r2, 505
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
