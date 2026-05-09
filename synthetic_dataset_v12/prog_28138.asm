; DESCRIPTION: Draws a white line from (187, 162) to (127, 25).
; PLAN: r0=187(x1), r1=162(y1), r2=127(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 162
LDI r2, 127
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
