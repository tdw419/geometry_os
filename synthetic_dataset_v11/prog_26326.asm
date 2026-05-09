; DESCRIPTION: Renders a blue line between points (107, 213) and (22, 171).
; PLAN: r0=107(x1), r1=213(y1), r2=22(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 213
LDI r2, 22
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
