; DESCRIPTION: Renders a purple line between points (444, 239) and (18, 195).
; PLAN: r0=444(x1), r1=239(y1), r2=18(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 239
LDI r2, 18
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
