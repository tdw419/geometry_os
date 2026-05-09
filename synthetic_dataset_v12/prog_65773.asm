; DESCRIPTION: Draws a cyan line from (269, 162) to (229, 81).
; PLAN: r0=269(x1), r1=162(y1), r2=229(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 162
LDI r2, 229
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
