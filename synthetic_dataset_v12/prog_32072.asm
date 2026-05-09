; DESCRIPTION: Renders a green line between points (289, 27) and (19, 99).
; PLAN: r0=289(x1), r1=27(y1), r2=19(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 27
LDI r2, 19
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
