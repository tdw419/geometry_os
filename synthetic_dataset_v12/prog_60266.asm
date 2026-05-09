; DESCRIPTION: Draws a white line from (386, 2) to (356, 160).
; PLAN: r0=386(x1), r1=2(y1), r2=356(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 2
LDI r2, 356
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
