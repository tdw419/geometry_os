; DESCRIPTION: Renders a green line between points (289, 66) and (214, 19).
; PLAN: r0=289(x1), r1=66(y1), r2=214(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 66
LDI r2, 214
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
