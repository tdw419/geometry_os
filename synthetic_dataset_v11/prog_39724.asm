; DESCRIPTION: Draws a cyan line from (175, 162) to (186, 38).
; PLAN: r0=175(x1), r1=162(y1), r2=186(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 162
LDI r2, 186
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
