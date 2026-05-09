; DESCRIPTION: Renders a green line between points (278, 127) and (340, 52).
; PLAN: r0=278(x1), r1=127(y1), r2=340(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 127
LDI r2, 340
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
