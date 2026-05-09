; DESCRIPTION: Draws a white line from (40, 48) to (455, 91).
; PLAN: r0=40(x1), r1=48(y1), r2=455(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 48
LDI r2, 455
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
