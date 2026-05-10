; DESCRIPTION: Renders a black line between points (164, 98) and (487, 61).
; PLAN: r0=164(x1), r1=98(y1), r2=487(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 98
LDI r2, 487
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
