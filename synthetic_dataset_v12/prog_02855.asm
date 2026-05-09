; DESCRIPTION: Draws a green line from (295, 149) to (325, 179).
; PLAN: r0=295(x1), r1=149(y1), r2=325(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 149
LDI r2, 325
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
