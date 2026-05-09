; DESCRIPTION: Renders a green line between points (358, 126) and (112, 210).
; PLAN: r0=358(x1), r1=126(y1), r2=112(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 126
LDI r2, 112
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
