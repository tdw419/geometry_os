; DESCRIPTION: Draws a cyan line from (104, 40) to (457, 186).
; PLAN: r0=104(x1), r1=40(y1), r2=457(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 40
LDI r2, 457
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
