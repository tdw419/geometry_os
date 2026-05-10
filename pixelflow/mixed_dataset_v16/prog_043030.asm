; DESCRIPTION: Draws a green line from (462, 148) to (386, 6).
; PLAN: r0=462(x1), r1=148(y1), r2=386(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 148
LDI r2, 386
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
