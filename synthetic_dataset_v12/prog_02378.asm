; DESCRIPTION: Places a yellow line segment connecting (166, 165) to (386, 138).
; PLAN: r0=166(x1), r1=165(y1), r2=386(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 165
LDI r2, 386
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
