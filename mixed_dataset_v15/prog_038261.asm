; DESCRIPTION: Renders a white line between points (465, 25) and (146, 168).
; PLAN: r0=465(x1), r1=25(y1), r2=146(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 25
LDI r2, 146
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
