; DESCRIPTION: Renders a green line between points (117, 105) and (289, 16).
; PLAN: r0=117(x1), r1=105(y1), r2=289(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 105
LDI r2, 289
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
