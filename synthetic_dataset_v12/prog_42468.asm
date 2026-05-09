; DESCRIPTION: Renders a red line between points (144, 237) and (66, 125).
; PLAN: r0=144(x1), r1=237(y1), r2=66(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 237
LDI r2, 66
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
