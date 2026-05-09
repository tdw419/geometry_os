; DESCRIPTION: Places a white line segment connecting (234, 151) to (75, 126).
; PLAN: r0=234(x1), r1=151(y1), r2=75(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 151
LDI r2, 75
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
