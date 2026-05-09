; DESCRIPTION: Renders a green line between points (172, 223) and (208, 224).
; PLAN: r0=172(x1), r1=223(y1), r2=208(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 223
LDI r2, 208
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
