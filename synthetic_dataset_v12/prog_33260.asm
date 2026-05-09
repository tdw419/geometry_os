; DESCRIPTION: Renders a magenta line between points (332, 239) and (293, 66).
; PLAN: r0=332(x1), r1=239(y1), r2=293(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 239
LDI r2, 293
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
