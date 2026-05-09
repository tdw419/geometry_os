; DESCRIPTION: Renders a green line between points (203, 47) and (27, 220).
; PLAN: r0=203(x1), r1=47(y1), r2=27(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 47
LDI r2, 27
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
