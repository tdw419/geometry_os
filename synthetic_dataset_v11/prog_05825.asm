; DESCRIPTION: Places a white line segment connecting (234, 48) to (240, 132).
; PLAN: r0=234(x1), r1=48(y1), r2=240(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 48
LDI r2, 240
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
