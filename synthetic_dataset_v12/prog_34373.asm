; DESCRIPTION: Renders a blue line between points (217, 205) and (40, 146).
; PLAN: r0=217(x1), r1=205(y1), r2=40(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 205
LDI r2, 40
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
