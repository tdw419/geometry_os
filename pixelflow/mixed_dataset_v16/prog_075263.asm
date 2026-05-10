; DESCRIPTION: Draws a white line from (433, 212) to (342, 162).
; PLAN: r0=433(x1), r1=212(y1), r2=342(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 212
LDI r2, 342
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
