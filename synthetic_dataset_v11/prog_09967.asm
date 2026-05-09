; DESCRIPTION: Renders a white line between points (242, 187) and (36, 74).
; PLAN: r0=242(x1), r1=187(y1), r2=36(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 187
LDI r2, 36
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
