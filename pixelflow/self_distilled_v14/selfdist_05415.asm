; DESCRIPTION: Draws a green line from (295, 177) to (297, 9).
; PLAN: r0=295(x1), r1=177(y1), r2=297(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 177
LDI r2, 297
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
