; DESCRIPTION: Renders a red line between points (367, 23) and (404, 62).
; PLAN: r0=367(x1), r1=23(y1), r2=404(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 23
LDI r2, 404
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
