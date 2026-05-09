; DESCRIPTION: Places a yellow line segment connecting (148, 209) to (138, 177).
; PLAN: r0=148(x1), r1=209(y1), r2=138(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 209
LDI r2, 138
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
