; DESCRIPTION: Places a cyan line segment connecting (204, 75) to (198, 186).
; PLAN: r0=204(x1), r1=75(y1), r2=198(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 75
LDI r2, 198
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
