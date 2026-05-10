; DESCRIPTION: Renders a green line between points (303, 19) and (336, 221).
; PLAN: r0=303(x1), r1=19(y1), r2=336(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 19
LDI r2, 336
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
