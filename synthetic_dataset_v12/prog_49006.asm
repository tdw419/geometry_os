; DESCRIPTION: Draws a cyan line from (133, 211) to (127, 218).
; PLAN: r0=133(x1), r1=211(y1), r2=127(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 211
LDI r2, 127
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
