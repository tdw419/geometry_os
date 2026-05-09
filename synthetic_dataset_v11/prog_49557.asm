; DESCRIPTION: Renders a blue line between points (213, 27) and (213, 243).
; PLAN: r0=213(x1), r1=27(y1), r2=213(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 27
LDI r2, 213
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
