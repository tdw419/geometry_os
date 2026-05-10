; DESCRIPTION: Renders a cyan line between points (404, 87) and (337, 36).
; PLAN: r0=404(x1), r1=87(y1), r2=337(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 87
LDI r2, 337
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
