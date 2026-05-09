; DESCRIPTION: Places a black line segment connecting (123, 163) to (434, 202).
; PLAN: r0=123(x1), r1=163(y1), r2=434(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 163
LDI r2, 434
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
