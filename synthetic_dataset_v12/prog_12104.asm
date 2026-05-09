; DESCRIPTION: Renders a cyan line between points (364, 12) and (404, 218).
; PLAN: r0=364(x1), r1=12(y1), r2=404(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 12
LDI r2, 404
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
