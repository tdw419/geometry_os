; DESCRIPTION: Draws a green line from (186, 29) to (234, 19).
; PLAN: r0=186(x1), r1=29(y1), r2=234(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 29
LDI r2, 234
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
