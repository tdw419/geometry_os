; DESCRIPTION: Renders a green line segment connecting (298, 33) to (130, 150).
; PLAN: r0=298(x1), r1=33(y1), r2=130(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 33
LDI r2, 130
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
