; DESCRIPTION: Renders a white line between points (222, 213) and (241, 21).
; PLAN: r0=222(x1), r1=213(y1), r2=241(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 213
LDI r2, 241
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
