; DESCRIPTION: Draws a yellow line from (104, 205) to (208, 231).
; PLAN: r0=104(x1), r1=205(y1), r2=208(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 205
LDI r2, 208
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
