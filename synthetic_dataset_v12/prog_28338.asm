; DESCRIPTION: Draws a green line from (69, 196) to (438, 71).
; PLAN: r0=69(x1), r1=196(y1), r2=438(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 196
LDI r2, 438
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
