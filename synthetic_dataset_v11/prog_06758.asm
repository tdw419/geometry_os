; DESCRIPTION: Renders a black line between points (97, 27) and (182, 177).
; PLAN: r0=97(x1), r1=27(y1), r2=182(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 27
LDI r2, 182
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
