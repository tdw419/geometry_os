; DESCRIPTION: Renders a white line between points (493, 238) and (288, 160).
; PLAN: r0=493(x1), r1=238(y1), r2=288(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 238
LDI r2, 288
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
