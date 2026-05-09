; DESCRIPTION: Renders a cyan line between points (203, 192) and (503, 5).
; PLAN: r0=203(x1), r1=192(y1), r2=503(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 192
LDI r2, 503
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
