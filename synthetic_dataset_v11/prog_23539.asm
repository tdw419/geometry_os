; DESCRIPTION: Renders a green line between points (204, 73) and (38, 126).
; PLAN: r0=204(x1), r1=73(y1), r2=38(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 73
LDI r2, 38
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
