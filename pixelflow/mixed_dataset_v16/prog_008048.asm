; DESCRIPTION: Renders a black line between points (322, 51) and (294, 209).
; PLAN: r0=322(x1), r1=51(y1), r2=294(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 51
LDI r2, 294
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
