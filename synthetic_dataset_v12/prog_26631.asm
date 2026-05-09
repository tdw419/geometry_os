; DESCRIPTION: Renders a purple line between points (217, 159) and (481, 166).
; PLAN: r0=217(x1), r1=159(y1), r2=481(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 159
LDI r2, 481
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
