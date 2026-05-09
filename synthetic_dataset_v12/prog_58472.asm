; DESCRIPTION: Renders a green line between points (252, 152) and (52, 72).
; PLAN: r0=252(x1), r1=152(y1), r2=52(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 152
LDI r2, 52
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
