; DESCRIPTION: Renders a cyan line between points (404, 148) and (203, 55).
; PLAN: r0=404(x1), r1=148(y1), r2=203(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 148
LDI r2, 203
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
