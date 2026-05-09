; DESCRIPTION: Renders a cyan line between points (403, 126) and (339, 217).
; PLAN: r0=403(x1), r1=126(y1), r2=339(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 126
LDI r2, 339
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
