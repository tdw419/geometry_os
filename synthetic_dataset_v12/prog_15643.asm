; DESCRIPTION: Draws a green line from (421, 160) to (216, 146).
; PLAN: r0=421(x1), r1=160(y1), r2=216(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 160
LDI r2, 216
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
