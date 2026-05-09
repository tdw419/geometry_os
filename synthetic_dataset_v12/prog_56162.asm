; DESCRIPTION: Renders a green line between points (324, 14) and (502, 181).
; PLAN: r0=324(x1), r1=14(y1), r2=502(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 14
LDI r2, 502
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
