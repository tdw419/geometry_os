; DESCRIPTION: Renders a black line between points (57, 24) and (171, 192).
; PLAN: r0=57(x1), r1=24(y1), r2=171(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 24
LDI r2, 171
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
