; DESCRIPTION: Draws a green line from (75, 178) to (170, 33).
; PLAN: r0=75(x1), r1=178(y1), r2=170(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 178
LDI r2, 170
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
