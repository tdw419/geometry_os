; DESCRIPTION: Places a white line segment connecting (79, 178) to (286, 138).
; PLAN: r0=79(x1), r1=178(y1), r2=286(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 178
LDI r2, 286
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
