; DESCRIPTION: Draws a green line from (189, 17) to (28, 29).
; PLAN: r0=189(x1), r1=17(y1), r2=28(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 17
LDI r2, 28
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
