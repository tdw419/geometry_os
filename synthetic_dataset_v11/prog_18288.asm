; DESCRIPTION: Renders a black line between points (172, 28) and (213, 177).
; PLAN: r0=172(x1), r1=28(y1), r2=213(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 28
LDI r2, 213
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
