; DESCRIPTION: Renders a black line between points (293, 215) and (511, 146).
; PLAN: r0=293(x1), r1=215(y1), r2=511(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 215
LDI r2, 511
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
