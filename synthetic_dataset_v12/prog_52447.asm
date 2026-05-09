; DESCRIPTION: Renders a green line between points (275, 213) and (53, 112).
; PLAN: r0=275(x1), r1=213(y1), r2=53(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 213
LDI r2, 53
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
