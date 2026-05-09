; DESCRIPTION: Renders a yellow line between points (469, 77) and (202, 146).
; PLAN: r0=469(x1), r1=77(y1), r2=202(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 77
LDI r2, 202
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
