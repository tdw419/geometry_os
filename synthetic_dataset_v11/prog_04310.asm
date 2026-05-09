; DESCRIPTION: Renders a cyan line between points (36, 250) and (233, 202).
; PLAN: r0=36(x1), r1=250(y1), r2=233(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 250
LDI r2, 233
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
