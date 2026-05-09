; DESCRIPTION: Draws a green line from (175, 171) to (251, 46).
; PLAN: r0=175(x1), r1=171(y1), r2=251(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 171
LDI r2, 251
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
