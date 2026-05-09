; DESCRIPTION: Draws a yellow line from (340, 13) to (142, 117).
; PLAN: r0=340(x1), r1=13(y1), r2=142(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 13
LDI r2, 142
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
