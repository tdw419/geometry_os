; DESCRIPTION: Renders a green line between points (29, 180) and (243, 186).
; PLAN: r0=29(x1), r1=180(y1), r2=243(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 180
LDI r2, 243
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
