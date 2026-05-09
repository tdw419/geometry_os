; DESCRIPTION: Renders a green line between points (220, 146) and (96, 165).
; PLAN: r0=220(x1), r1=146(y1), r2=96(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 146
LDI r2, 96
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
