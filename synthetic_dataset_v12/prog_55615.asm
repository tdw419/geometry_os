; DESCRIPTION: Draws a green line from (169, 32) to (247, 18).
; PLAN: r0=169(x1), r1=32(y1), r2=247(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 32
LDI r2, 247
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
