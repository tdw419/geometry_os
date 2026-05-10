; DESCRIPTION: Renders a magenta line segment connecting (298, 116) to (273, 37).
; PLAN: r0=298(x1), r1=116(y1), r2=273(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 116
LDI r2, 273
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
