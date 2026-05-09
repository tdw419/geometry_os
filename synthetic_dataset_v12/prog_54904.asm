; DESCRIPTION: Renders a black line between points (352, 138) and (225, 173).
; PLAN: r0=352(x1), r1=138(y1), r2=225(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 138
LDI r2, 225
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
