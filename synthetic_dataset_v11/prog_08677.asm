; DESCRIPTION: Places a white line segment connecting (234, 138) to (234, 175).
; PLAN: r0=234(x1), r1=138(y1), r2=234(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 138
LDI r2, 234
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
