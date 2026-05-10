; DESCRIPTION: Renders a cyan line between points (404, 43) and (47, 60).
; PLAN: r0=404(x1), r1=43(y1), r2=47(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 43
LDI r2, 47
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
