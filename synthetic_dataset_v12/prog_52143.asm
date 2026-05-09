; DESCRIPTION: Places a green line segment connecting (138, 73) to (386, 132).
; PLAN: r0=138(x1), r1=73(y1), r2=386(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 73
LDI r2, 386
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
