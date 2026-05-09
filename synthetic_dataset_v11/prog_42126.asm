; DESCRIPTION: Draws a white line from (187, 91) to (102, 17).
; PLAN: r0=187(x1), r1=91(y1), r2=102(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 91
LDI r2, 102
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
