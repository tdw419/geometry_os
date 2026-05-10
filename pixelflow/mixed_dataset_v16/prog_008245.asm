; DESCRIPTION: Renders a green line between points (275, 112) and (130, 37).
; PLAN: r0=275(x1), r1=112(y1), r2=130(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 112
LDI r2, 130
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
