; DESCRIPTION: Renders a black line between points (103, 220) and (180, 221).
; PLAN: r0=103(x1), r1=220(y1), r2=180(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 220
LDI r2, 180
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
