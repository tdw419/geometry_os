; DESCRIPTION: Draws a white line from (281, 58) to (162, 15).
; PLAN: r0=281(x1), r1=58(y1), r2=162(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 58
LDI r2, 162
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
