; DESCRIPTION: Places a blue line segment connecting (272, 196) to (498, 166).
; PLAN: r0=272(x1), r1=196(y1), r2=498(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 196
LDI r2, 498
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
