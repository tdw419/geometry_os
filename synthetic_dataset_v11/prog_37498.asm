; DESCRIPTION: Draws a green line from (56, 223) to (33, 225).
; PLAN: r0=56(x1), r1=223(y1), r2=33(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 223
LDI r2, 33
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
