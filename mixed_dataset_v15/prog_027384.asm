; DESCRIPTION: Draws a yellow line from (75, 82) to (331, 152).
; PLAN: r0=75(x1), r1=82(y1), r2=331(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 82
LDI r2, 331
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
