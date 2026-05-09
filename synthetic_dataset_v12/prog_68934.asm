; DESCRIPTION: Renders a cyan line between points (413, 139) and (218, 49).
; PLAN: r0=413(x1), r1=139(y1), r2=218(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 139
LDI r2, 218
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
