; DESCRIPTION: Renders a green line between points (46, 49) and (404, 92).
; PLAN: r0=46(x1), r1=49(y1), r2=404(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 49
LDI r2, 404
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
