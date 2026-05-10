; DESCRIPTION: Draws a cyan line from (315, 22) to (129, 117).
; PLAN: r0=315(x1), r1=22(y1), r2=129(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 22
LDI r2, 129
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
