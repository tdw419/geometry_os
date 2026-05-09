; DESCRIPTION: Renders a black line between points (225, 249) and (131, 239).
; PLAN: r0=225(x1), r1=249(y1), r2=131(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 249
LDI r2, 131
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
