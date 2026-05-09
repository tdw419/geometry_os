; DESCRIPTION: Renders a green line between points (245, 90) and (264, 127).
; PLAN: r0=245(x1), r1=90(y1), r2=264(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 90
LDI r2, 264
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
