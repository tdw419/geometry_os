; DESCRIPTION: Renders a yellow line between points (115, 212) and (52, 213).
; PLAN: r0=115(x1), r1=212(y1), r2=52(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 212
LDI r2, 52
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
