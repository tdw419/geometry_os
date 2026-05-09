; DESCRIPTION: Draws a cyan line from (262, 110) to (33, 104).
; PLAN: r0=262(x1), r1=110(y1), r2=33(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 110
LDI r2, 33
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
