; DESCRIPTION: Draws a white line from (191, 68) to (386, 84).
; PLAN: r0=191(x1), r1=68(y1), r2=386(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 68
LDI r2, 386
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
