; DESCRIPTION: Draws a white line from (114, 162) to (334, 171).
; PLAN: r0=114(x1), r1=162(y1), r2=334(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 162
LDI r2, 334
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
