; DESCRIPTION: Renders a white line between points (146, 215) and (132, 60).
; PLAN: r0=146(x1), r1=215(y1), r2=132(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 215
LDI r2, 132
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
