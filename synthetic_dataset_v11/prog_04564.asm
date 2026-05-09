; DESCRIPTION: Renders a green line between points (98, 130) and (150, 144).
; PLAN: r0=98(x1), r1=130(y1), r2=150(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 130
LDI r2, 150
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
