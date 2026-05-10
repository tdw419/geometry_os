; DESCRIPTION: Renders a yellow line between points (226, 223) and (78, 213).
; PLAN: r0=226(x1), r1=223(y1), r2=78(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 223
LDI r2, 78
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
