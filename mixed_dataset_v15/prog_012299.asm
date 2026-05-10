; DESCRIPTION: Renders a blue line segment connecting (39, 146) to (171, 103).
; PLAN: r0=39(x1), r1=146(y1), r2=171(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 146
LDI r2, 171
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
