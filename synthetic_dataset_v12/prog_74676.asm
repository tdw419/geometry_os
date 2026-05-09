; DESCRIPTION: Renders a cyan line between points (503, 203) and (457, 177).
; PLAN: r0=503(x1), r1=203(y1), r2=457(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 203
LDI r2, 457
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
