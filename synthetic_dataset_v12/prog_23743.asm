; DESCRIPTION: Draws a green line from (450, 104) to (365, 179).
; PLAN: r0=450(x1), r1=104(y1), r2=365(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 104
LDI r2, 365
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
