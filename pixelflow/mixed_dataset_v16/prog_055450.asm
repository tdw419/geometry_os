; DESCRIPTION: Renders a green line between points (293, 214) and (272, 81).
; PLAN: r0=293(x1), r1=214(y1), r2=272(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 214
LDI r2, 272
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
