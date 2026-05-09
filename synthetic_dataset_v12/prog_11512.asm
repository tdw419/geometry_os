; DESCRIPTION: Renders a white line between points (366, 154) and (362, 4).
; PLAN: r0=366(x1), r1=154(y1), r2=362(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 154
LDI r2, 362
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
