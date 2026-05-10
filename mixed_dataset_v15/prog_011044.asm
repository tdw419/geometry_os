; DESCRIPTION: Draws a green line from (428, 44) to (205, 44).
; PLAN: r0=428(x1), r1=44(y1), r2=205(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 44
LDI r2, 205
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
