; DESCRIPTION: Renders a red line between points (347, 213) and (398, 51).
; PLAN: r0=347(x1), r1=213(y1), r2=398(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 213
LDI r2, 398
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
